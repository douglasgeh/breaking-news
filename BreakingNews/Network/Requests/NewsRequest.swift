//
//  NewsRequest.swift
//  BreakingNews
//
//  Created by Douglas Gehring on 12/01/21.
//  Copyright © 2021 Douglas Gehring. All rights reserved.
//

import Foundation

struct NewsRequest: Requestable {
    
    private let path: String
    private let method: String
    private let token: JWT
    
    init(path: String, token: JWT) {
        self.path = path
        self.method = "GET"
        self.token = token
    }
    
    func urlRequest() -> URLRequest? {
        guard let url = URL(string: BreakingNewsAPIBasePaths.dev) else {
            return nil
        }
        
        var request = URLRequest(url: url.appendingPathComponent(self.path))
        request.httpMethod = self.method
        request.setValue("application/json", forHTTPHeaderField: "content-type")
        request.setValue("application/json", forHTTPHeaderField: "Acept")
        request.setValue("Bearer \(self.token)", forHTTPHeaderField: "Authorization")
        
        return request
    }

}
