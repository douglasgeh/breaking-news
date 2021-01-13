//
//  NewClient.swift
//  BreakingNews
//
//  Created by Douglas Gehring on 12/01/21.
//  Copyright © 2021 Douglas Gehring. All rights reserved.
//

import Foundation

struct BreakingNewsAPIBasePaths {
    static let dev = "https://teste-dev-mobile-api.herokuapp.com"
}

struct BreakingNewsAPIRoutes {
    static let auth = "/login"
    static let news = "/news"
}

public class BreakingNewsClient {
    static let shared = BreakingNewsClient()
    
    func authenticateUser(with credentials: AuthCredentials, completion: @escaping(Result<JWT, Error>) -> Void) {
        let authRequest = AuthRequest(credentials)
        Network.shared.send(authRequest) { requestResult in
            switch requestResult {
            case .success (let authResult): JSONParser.parse(authResult: authResult, completion)
            case .failure (let error): completion(.failure(error))
            }
        }
    }
    
    func fetchNewsList(completion: @escaping(Result<[News], Error>) -> Void) {
        guard let jwt = KeychainManager.shared.getJWT() else {
            completion(.failure(ErrorDefinitions.failureObtainingJWTFromKeychain))
            return
        }
        let newsListRequest = NewsRequest(path: BreakingNewsAPIRoutes.news, token: jwt)
        Network.shared.send(newsListRequest) { requestResult in
            switch requestResult {
            case .success (let newsResult): JSONParser.parse(newsResult: newsResult, completion)
            case .failure (let error): completion(.failure(error))
            }
        }
    }
    
    func fetchNewsDetail(by id: String, completion: @escaping(Result<NewsDetail, Error>) -> Void) {
        guard let jwt = KeychainManager.shared.getJWT() else {
            completion(.failure(ErrorDefinitions.failureObtainingJWTFromKeychain))
            return
        }
        let newsListRequest = NewsRequest(path: "\(BreakingNewsAPIRoutes.news)/\(id)", token: jwt)
        Network.shared.send(newsListRequest) { requestResult in
            switch requestResult {
            case .success (let newsDetailResult): JSONParser.parse(newsDetailResult: newsDetailResult, completion)
            case .failure (let error): completion(.failure(error))
            }
        }
    }
    
    func fetchNewsDetailImg(by path: String, completion: @escaping(Result<Data, Error>) -> Void) {
        guard let url = URL(string: path) else {
            completion(.failure(ErrorDefinitions.failureCreatingUrlRequest))
            return
        }
        let imgUrlRequest = URLRequest(url: url)
        Network.shared.send(imgUrlRequest) { requestResult in
            switch requestResult {
            case .success (let imgData): completion(.success(imgData))
            case .failure (let error): completion(.failure(error))
            }
        }
    }
}
