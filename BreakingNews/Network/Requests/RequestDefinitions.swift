//
//  RequestDefinitions.swift
//  BreakingNews
//
//  Created by Douglas Gehring on 12/01/21.
//  Copyright © 2021 Douglas Gehring. All rights reserved.
//

import Foundation

protocol Requestable {
    func urlRequest() -> URLRequest?
}

extension URLRequest: Requestable {
    func urlRequest() -> URLRequest? { return self }
}
