//
//  UILabel+Styling.swift
//  Breaking
//
//  Created by Douglas Gehring on 12/01/21.
//  Copyright © 2021 Douglas Gehring. All rights reserved.
//

import UIKit

extension UILabel {
    func setBaseTitleCellLayout() {
        self.textColor = AppConstants.Design.Colors.primaryText
        self.font = AppConstants.Design.Fonts.primaryTextMedium
        self.numberOfLines = 3
    }
    
    func setDescriptionTitleCellLayout() {
        self.textColor = AppConstants.Design.Colors.secondaryText
        self.font = AppConstants.Design.Fonts.secondaryTextRegular
        self.numberOfLines = 2
    }
}
