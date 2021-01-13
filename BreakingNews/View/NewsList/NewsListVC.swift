//
//  NewsListVC.swift
//  BreakingNews
//
//  Created by Douglas Gehring on 12/01/21.
//  Copyright © 2021 Douglas Gehring. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class NewsListVC: BaseViewController {

    @IBOutlet weak var newsTableView: UITableView!
    
    private let newsTableViewDelegate = BaseTableViewDelegate(heightForRow: 100.0)
    private let viewModel = NewsListViewModel()
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setBaseLayout()
        self.configLayout()
        self.registerNibsForTableView()
        self.bindNewsTableViewTap()
        self.bindNewsViewToDelegate()
        self.bindNewsListToTableView()
        self.viewModel.loadNews()
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
    
    private func registerNibsForTableView() {
        self.newsTableView.register(cellType: BasicCell.self)
    }
    
    private func bindNewsViewToDelegate() {
        self.newsTableView
            .rx
            .setDelegate(self.newsTableViewDelegate)
            .disposed(by: self.disposeBag)
    }
    
    private func bindNewsTableViewTap() {
        self.newsTableView
            .rx
            .modelSelected(News.self)
            .subscribe(onNext: { [weak self] news in
                guard let self = self else { return }
                self.presentNewsDetail(for: news)
        })
            .disposed(by: self.disposeBag)

    }
    
    private func bindNewsListToTableView() {
        self.viewModel.news
            .bind(to: self.newsTableView.rx.items(cellIdentifier: "\(BasicCell.self)", cellType: BasicCell.self)) { _, news, cell in
                cell.configure(for: news)
        }
        .disposed(by: self.disposeBag)
    }
    
    private func presentNewsDetail(for news: News) {
        self.navigationController?.pushViewController(AppFlowManager.toNewsDetail(news), animated: true)
    }
}
