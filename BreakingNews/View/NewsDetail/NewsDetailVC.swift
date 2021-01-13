//
//  NewsDetailVC.swift
//  BreakingNews
//
//  Created by Douglas Gehring on 12/01/21.
//  Copyright © 2021 Douglas Gehring. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class NewsDetailVC: BaseViewController {

    @IBOutlet weak var backgroundImgView: UIImageView!
    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var newsDescripion: UILabel!
    @IBOutlet weak var newsDate: UILabel!
    @IBOutlet weak var newsBody: UITextView!
    
    private var viewModel: NewsDetailViewModel!
    private let disposeBag = DisposeBag()
    var news: News!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setBaseLayout()
        self.viewModel = NewsDetailViewModel(news: news)
        self.configBackgroundImageSubscriber()
        self.configNewsDetailSubscriber()
        self.bindLargeTitleConfiguration()
        self.viewModel.loadNewsDetail()
    }
    
    private func bindLargeTitleConfiguration() {
        guard let navController = self.navigationController else { return }
        self.viewModel.largeTitleConfig
            .bind(to: navController.navigationBar.rx.prefersLargeTitles)
            .disposed(by: self.disposeBag)
    }
    
    private func configBackgroundImageSubscriber() {
        self.viewModel.newsPageImageData
            .subscribe(onNext: { [weak self] backgroundImgData in
                guard let self = self else { return }
                self.updateUI(for: backgroundImgData)
            })
            .disposed(by: self.disposeBag)
    }
    
    private func configNewsDetailSubscriber() {
        self.viewModel.newsDetail
            .subscribe(onNext: { [weak self] newsDetail in
                guard let self = self else { return }
                self.updateUI(for: newsDetail)
            })
            .disposed(by: self.disposeBag)
    }
    
    private func updateUI(for newsImgData: Data) {
        guard let img = UIImage(data: newsImgData) else { return }
        DispatchQueue.main.async {
            self.backgroundImgView.image = img
        }
    }
    
    private func updateUI(for newsDetail: NewsDetail) {
        DispatchQueue.main.async {
            self.place(newsBodyHTML: newsDetail.corpoformatado)
            self.newsTitle.text = newsDetail.titulo
            self.newsDescripion.text = newsDetail.linhafina
            self.newsDate.text = newsDetail.datapub
        }
    }
    
    private func place(newsBodyHTML: String?) {
        guard let newsBodyHTMl = newsBodyHTML else { return }
        newsBodyHTMl.toNSAttributedString { conversionResult in
            switch conversionResult {
            case .success(let newsBodyAttrStr):
                DispatchQueue.main.async {
                    self.newsBody.attributedText = newsBodyAttrStr
                        .set(textColor: AppConstants.Design.Colors.primaryText)
                        .set(font: AppConstants.Design.Fonts.secondaryTextRegular)
                }
            case .failure(let error):
                DispatchQueue.main.async { self.newsBody.text = error.localizedDescription }
            }
        }
    }
}
