//
//  AppFlowManager.swift
//  BreakingNews
//
//  Created by Douglas Gehring on 12/01/21.
//  Copyright © 2021 Douglas Gehring. All rights reserved.
//

import UIKit

class AppFlowManager {
    static func start() -> UIViewController {
        let authVC = AuthenticationVC()
        let authNav = UINavigationController(rootViewController: authVC)
        authNav.modalPresentationStyle = .fullScreen
        return authNav
    }
    
    static func toNewsList() -> UIViewController {
        let newsListVC = NewsListVC()
        let newsListNav = UINavigationController(rootViewController: newsListVC)
        newsListNav.modalPresentationStyle = .fullScreen
        return newsListNav
    }
    
    static func toNewsDetail(_ news: News) -> UIViewController {
        let newsDetailVC = NewsDetailVC()
        newsDetailVC.news = news
        return newsDetailVC
    }
}
