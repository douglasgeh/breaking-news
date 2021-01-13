//
//  String+Credentials.swift
//  BreakingNews
//
//  Created by Douglas Gehring on 12/01/21.
//  Copyright © 2021 Douglas Gehring. All rights reserved.
//

import Foundation

extension String {
    func isValidUser() -> Bool {
        return !self.isEmpty
    }
    
    func isValidPassword() -> Bool {
        return !self.isEmpty
    }
}
