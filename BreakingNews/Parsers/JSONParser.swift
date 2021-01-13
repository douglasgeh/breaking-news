//
//  JSONParser.swift
//  BreakingNews
//
//  Created by Douglas Gehring on 12/01/21.
//  Copyright © 2021 Douglas Gehring. All rights reserved.
//

import Foundation

class JSONParser {
    static func parse(authResult: Data, _ completion: @escaping(Result<JWT, Error>) -> Void) {
        do{
            let parsedData = try JSONSerialization.jsonObject(with: authResult, options: .allowFragments)
            guard let jsonResult = parsedData as? ModelAdapter,
                let jwt = jsonResult["token"] else {
                    completion(.failure(ErrorDefinitions.failureParsingToken))
                    return
            }
            completion(.success(jwt))
        } catch let error {
            completion(.failure(error))
        }
    }
    
    static func parse(newsResult: Data, _ completion: @escaping(Result<[News], Error>) -> Void) {
        do{
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .useDefaultKeys
            let decodedNews = try decoder.decode([News].self, from: newsResult)
            completion(.success(decodedNews))
        } catch let error {
            
            completion(.failure(error))
        }
    }
    
    static func parse(newsDetailResult: Data, _ completion: @escaping(Result<NewsDetail, Error>) -> Void) {
        do{
            let parsedData = try JSONSerialization.jsonObject(with: newsDetailResult, options: .allowFragments)
            guard let jsonResult = parsedData as? [[String: Any]],
                let firstDocument = jsonResult.first,
                let documentContent = firstDocument["documento"] else {
                    completion(.failure(ErrorDefinitions.failureParsingNewsDetail))
                    return
            }
            let documentData = try JSONSerialization.data(withJSONObject: documentContent, options: .prettyPrinted)
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .useDefaultKeys
            let decodedNewsDetail = try decoder.decode(NewsDetail.self, from: documentData)
            completion(.success(decodedNewsDetail))
            
        } catch let error {
            completion(.failure(error))
        }
    }
    
}
