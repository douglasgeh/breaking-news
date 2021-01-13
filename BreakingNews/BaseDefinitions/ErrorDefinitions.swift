//
//  AppErrors.swift
//  BreakingNews
//
//  Created by Douglas Gehring on 12/01/21.
//  Copyright © 2021 Douglas Gehring. All rights reserved.
//

import Foundation

enum ErrorDefinitions: LocalizedError {
    case failureCreatingUrlRequest
    case failureParsingToken
    case failureRequestingData
    case failureUnwrappingNewsID
    case failureParsingNewsDetail
    case failureConvertingHtmlToAttrString
    case failureObtainingJWTFromKeychain
    
    var errorDescription: String? {
        switch self {
        case .failureCreatingUrlRequest: return "URL Creation Error"
        case .failureParsingToken: return "Failure parsing token"
        case .failureRequestingData: return "Failure fetching token"
        case .failureUnwrappingNewsID: return "Failure unwrapping news ID"
        case .failureParsingNewsDetail: return "Failure parsing news detail"
        case .failureConvertingHtmlToAttrString: return "Failure converting html to attributed string"
        case .failureObtainingJWTFromKeychain: return "Failure getting JWT token from keychain"
        }
    }
    
    var errorCode: Int? {
        switch self {
        case .failureCreatingUrlRequest: return -1
        case .failureParsingToken: return -2
        case .failureRequestingData: return -3
        case .failureUnwrappingNewsID: return -4
        case .failureParsingNewsDetail: return -5
        case .failureConvertingHtmlToAttrString: return -6
        case .failureObtainingJWTFromKeychain: return -7
        }
    }
}
