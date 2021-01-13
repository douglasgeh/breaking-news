//
//  AuthCredentials.swift
//  BreakingNews
//
//  Created by Douglas Gehring on 12/01/21.
//  Copyright © 2021 Douglas Gehring. All rights reserved.
//

import Foundation

typealias HttpBodyAdapter = [String: String]

enum AuthCredentialsKeys: String {
    case user
    case pass
}

struct AuthCredentials {
    let user: String
    let pass: String
    
    func toHttpBodyAdapter() -> HttpBodyAdapter {
        return [
            AuthCredentialsKeys.user.rawValue: user,
            AuthCredentialsKeys.pass.rawValue: pass
        ]
    }
}
