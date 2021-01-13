//
//  String+HTMLConverter.swift
//  BreakingNews
//
//  Created by Douglas Gehring on 12/01/21.
//  Copyright © 2021 Douglas Gehring. All rights reserved.
//

import Foundation

extension String {
    func toNSAttributedString(result: (Result<NSAttributedString, Error>) -> Void) {
        let htmlData = Data(self.utf8)
    
        guard let attributedString = try? NSAttributedString(data: htmlData, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil) else {
            result(.failure(ErrorDefinitions.failureConvertingHtmlToAttrString))
            return
        }
        
        result(.success(attributedString))
    }
}
