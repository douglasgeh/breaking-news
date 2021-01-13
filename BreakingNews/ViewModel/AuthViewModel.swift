//
//  AuthViewModel.swift
//  BreakingNews
//
//  Created by Douglas Gehring on 12/01/21.
//  Copyright © 2021 Douglas Gehring. All rights reserved.
//

import Foundation
import RxSwift

enum AuthStatus {
    case success
    case failure (Error)
}

class AuthViewModel {
    
    let authStatus = PublishSubject<AuthStatus>()
    private let credentials = PublishSubject<AuthCredentials>()
    
    let screenName = BehaviorSubject<String>(value: AppConstants.Title.signInTitle)
    let largeTitleConfig = BehaviorSubject<Bool>(value: true)
    
    private let disposeBag = DisposeBag()
   
    init() {
        self.configCredentialsSubscriber()
    }
    
    func configCredentialsSubscriber() {
        self.credentials
        .subscribe(onNext: { [weak self] authCredentials in
            guard let self = self else { return }
            self.performAuthentication(with: authCredentials)
        })
        .disposed(by: self.disposeBag)
    }
    
    func set(_ authCredentials: AuthCredentials) {
        self.credentials.onNext(authCredentials)
    }
    
    
    private func performAuthentication(with credentials: AuthCredentials) {
        BreakingNewsClient.shared.authenticateUser(with: credentials) { authResult in
            switch authResult {
            case .success(let jwt):
                KeychainManager.shared.save(jwt)
                self.authStatus.onNext(AuthStatus.success)
            case .failure(let error):
                self.authStatus.onNext(AuthStatus.failure(error))
            }
        }
    }
}
