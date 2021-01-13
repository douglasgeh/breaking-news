//
//  LayoutManager.swift
//  BreakingNews
//
//  Created by Douglas Gehring on 12/01/21.
//  Copyright © 2021 Douglas Gehring. All rights reserved.
//

import UIKit

/*
    Class: LayoutManager
    Description: Handle layout changes that are global thoughout the application
*/

class LayoutManager {
    static let shared = LayoutManager()
    
    func configure() {
        UINavigationBar.appearance().barTintColor = AppConstants.Design.Colors.primaryText
        UINavigationBar.appearance().tintColor = AppConstants.Design.Colors.primaryText
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor : AppConstants.Design.Colors.primaryText]
        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: AppConstants.Design.Colors.primaryText]
    }
}
