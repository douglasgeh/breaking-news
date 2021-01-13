//
//  Network.swift
//  BreakingNews
//
//  Created by Douglas Gehring on 12/01/21.
//  Copyright © 2021 Douglas Gehring. All rights reserved.
//

import Foundation

class Network {
    static let shared = Network()
    let session: URLSession = URLSession(configuration: .default)
    
    func send(_ request: Requestable,
              completion: @escaping (Result<Data, Error>)->Void) {
        
        guard let urlRequest = request.urlRequest() else {
            completion(.failure(ErrorDefinitions.failureCreatingUrlRequest))
            return
        }
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let data = data else {
                completion(.failure(error ?? ErrorDefinitions.failureRequestingData))
                return
            }
            
            completion(.success(data))
        }
        
        task.resume()
    }

}
