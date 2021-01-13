//
//  Request.swift
//  BreakingNews
//
//  Created by Douglas Gehring on 12/01/21.
//  Copyright © 2021 Douglas Gehring. All rights reserved.
//

import Foundation


struct AuthRequest: Requestable {
    let method: String
    let credentials: AuthCredentials
    
    init(_ credentials: AuthCredentials) {
        self.method = "POST"
        self.credentials = credentials
    }
    
    func urlRequest() -> URLRequest? {
        guard let url = URL(string: BreakingNewsAPIBasePaths.dev) else {
            return nil
        }
        
        var request = URLRequest(url: url.appendingPathComponent(BreakingNewsAPIRoutes.auth))
        request.httpMethod = self.method
        request.setValue("application/json", forHTTPHeaderField: "content-type")
        request.setValue("application/json", forHTTPHeaderField: "Acept")
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: credentials.toHttpBodyAdapter(), options: .prettyPrinted)
        } catch let error {
            Logger.log(error: error, location: "\(AuthRequest.self)")
        }
        
        return request
    }
}
