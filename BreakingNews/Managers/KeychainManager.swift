//
//  KeyChainManager.swift
//  BreakingNews
//
//  Created by Douglas Gehring on 13/01/21.
//  Copyright © 2021 Douglas Gehring. All rights reserved.
//

import Foundation
import KeychainAccess

class KeychainManager {
    static let shared = KeychainManager()
    private let keychain = Keychain()
    
    func save(_ jwt: String) {
        self.keychain["token"] = jwt
    }
    
    func getJWT() -> String? {
        return self.keychain["token"]
    }
    
    func update(value: String, forKey key: String) {
        self.keychain[key] = value
    }
    
    func getValue(forKey key: String) -> String? {
        return self.keychain[key]
    }
}
