//
//  Logger.swift
//  BreakingNews
//
//  Created by Douglas Gehring on 12/01/21.
//  Copyright © 2021 Douglas Gehring. All rights reserved.
//

import Foundation

class Logger {
    static func log(error: Error, location: String) {
        debugPrint("Error: \(error.localizedDescription) Location: \(location)")
    }
}
