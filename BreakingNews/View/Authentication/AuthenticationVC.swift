//
//  AuthenticationVC.swift
//  BreakingNews
//
//  Created by Douglas Gehring on 12/01/21.
//  Copyright © 2021 Douglas Gehring. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class AuthenticationVC: BaseViewController {

    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    @IBOutlet weak var signInBtn: UIButton!
    
    private let viewModel = AuthViewModel()
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configLayout()
        self.configButtonSubscriber()
        self.configSignInStatusSubscriber()
        self.bindLargeTitleConfiguration()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.userTextField.becomeFirstResponder()
    }
    
    private func bindLargeTitleConfiguration() {
        guard let navController = self.navigationController else { return }
        self.viewModel.largeTitleConfig
            .bind(to: navController.navigationBar.rx.prefersLargeTitles)
            .disposed(by: self.disposeBag)
    }
    
    private func configLayout() {
        self.setBaseLayout()
        self.viewModel.screenName
            .bind(to: self.navigationItem.rx.title)
            .disposed(by: self.disposeBag)
    }
    
    private func configSignInStatusSubscriber() {
        self.viewModel.authStatus
            .subscribe(onNext: { [weak self] authStatus in
                guard let self = self else { return }
                self.updateUIAccording(to: authStatus)
            })
            .disposed(by: self.disposeBag)
    }
    
    private func updateUIAccording(to authStatus: AuthStatus) {
        switch authStatus {
        case .success: self.proceedToNewList()
        case .failure(let error): self.placeSignInErrorAlert(with: error)
        }
    }
    
    private func placeSignInErrorAlert(with error: Error) {
        Logger.log(error: error, location: "\(AuthenticationVC.self)")
    }
    
    private func proceedToNewList() {
        DispatchQueue.main.async {
            self.setLoadingIndicator(enabled: false)
            self.present(AppFlowManager.toNewsList(), animated: true)
        }
    }
    
    private func configButtonSubscriber() {
        self.signInBtn
            .rx
            .tap
            .subscribe(onNext: { [weak self] in
                guard let self = self else { return }
                self.performSignIn()
            })
            .disposed(by: self.disposeBag)
    }
    
    private func performSignIn() {
        guard let user = self.userTextField.text, user.isValidUser(),
            let pass = self.passTextField.text, pass.isValidPassword() else {
                return
        }
        
//        let user = "devmobile"
//        let pass = "uC&+}H4wg?rYbF:"
        self.setLoadingIndicator(enabled: true)
        let authCredentials = AuthCredentials(user: user, pass: pass)
        self.viewModel.set(authCredentials)
    }
}
