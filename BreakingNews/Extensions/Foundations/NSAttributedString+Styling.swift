//
//  NSAttributedString+Styling.swift
//  BreakingNews
//
//  Created by Douglas Gehring on 12/01/21.
//  Copyright © 2021 Douglas Gehring. All rights reserved.
//

import UIKit

extension NSAttributedString {
    func set(textColor: UIColor) -> NSAttributedString {
        let mutableString = NSMutableAttributedString(attributedString: self)
        mutableString.addAttributes([NSAttributedString.Key.foregroundColor: textColor], range: NSRange(location: 0, length: self.length))
        return mutableString
    }
    
    func set(font: UIFont) -> NSAttributedString {
        let mutableString = NSMutableAttributedString(attributedString: self)
        mutableString.addAttributes([NSAttributedString.Key.font: font], range: NSRange(location: 0, length: self.length))
        return mutableString
    }
}
