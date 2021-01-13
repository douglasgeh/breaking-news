//
//  NewsListViewModel.swift
//  BreakingNews
//
//  Created by Douglas Gehring on 12/01/21.
//  Copyright © 2021 Douglas Gehring. All rights reserved.
//

import Foundation
import RxSwift

class NewsListViewModel {
    
    let news = BehaviorSubject<[News]>(value: [])
    let fetchingError = PublishSubject<Error>()
    
    let screenName = BehaviorSubject<String>(value: AppConstants.Title.newsListTitle)
    let largeTitleConfig = BehaviorSubject<Bool>(value: false)
    
    private let disposeBag = DisposeBag()
    
    func loadNews() {
        BreakingNewsClient.shared.fetchNewsList { newsResult in
            switch newsResult {
            case .success(let freshNews): self.news.onNext(freshNews)
            case .failure(let error): self.fetchingError.onNext(error)
            }
        }
    }
}
