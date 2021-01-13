//
//  NewsDetailViewModel.swift
//  BreakingNews
//
//  Created by Douglas Gehring on 12/01/21.
//  Copyright © 2021 Douglas Gehring. All rights reserved.
//

import Foundation
import RxSwift

class NewsDetailViewModel {
    
    private let news: News!
    let newsFetchingError = PublishSubject<Error>()
    let newsImgFetchingError = PublishSubject<Error>()
    let newsDetail = PublishSubject<NewsDetail>()
    let newsPageImageData = PublishSubject<Data>()
    
    let largeTitleConfig = BehaviorSubject<Bool>(value: false)
    
    private let disposeBag = DisposeBag()
    
    init(news: News) {
        self.news = news
        self.configNewsDetailSubscriber()
    }
    
    private func configNewsDetailSubscriber() {
        self.newsDetail
            .subscribe(onNext: { [weak self] newsDetail in
                guard let self = self else { return }
                self.loadPageImageData(with: newsDetail.imagem)
            })
            .disposed(by: self.disposeBag)
    }
    
    private func loadPageImageData(with imgPath: String?) {
        guard let imgPath = imgPath else { return }
        BreakingNewsClient.shared.fetchNewsDetailImg(by: imgPath) { newsImgResult in
            switch newsImgResult {
            case .success(let imgData): self.newsPageImageData.onNext(imgData)
            case .failure(let error): self.newsImgFetchingError.onNext(error)
            }
        }
    }
    
    func loadNewsDetail() {
        guard let newsID = self.news.id_documento else {
            self.newsFetchingError.onNext(ErrorDefinitions.failureUnwrappingNewsID)
            return
        }
    
        BreakingNewsClient.shared.fetchNewsDetail(by: newsID) { newsDetailResult in
            switch newsDetailResult {
            case .success(let newsDetail): self.newsDetail.onNext(newsDetail)
            case .failure(let error): self.newsFetchingError.onNext(error)
            }
        }
    }
}
