//
//  BaseViewController.swift
//  BreakingNews
//
//  Created by Douglas Gehring on 12/01/21.
//  Copyright © 2021 Douglas Gehring. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
 
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    @available(*, unavailable, message: "Not implemented")
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setBaseLayout() {
        self.view.backgroundColor = AppConstants.Design.Colors.viewBackground
        self.navigationController?.clearBackground()
    }
    
    func setLoadingIndicator(enabled: Bool) {
        guard enabled else {
            self.removeLoadingIndicator()
            return
        }
        self.placeLoadingIndicator()
    }
    
    private func placeLoadingIndicator() {
        let loadingView = LoadingView(frame: self.view.frame)
        loadingView.loadAnimation()
        DispatchQueue.main.async {
            self.view.addSubview(loadingView)
        }
    }
    
    private func removeLoadingIndicator() {
        DispatchQueue.main.async {
          self.view.removeSubView(withTag: AppConstants.Logics.Tags.loadingIndicator)
        }
    }
}
