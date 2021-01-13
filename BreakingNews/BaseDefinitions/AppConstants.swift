//
//  AppConstants.swift
//  BreakingNews
//
//  Created by Douglas Gehring on 12/01/21.
//  Copyright © 2021 Douglas Gehring. All rights reserved.
//

import UIKit

struct AppConstants {
    
    struct Title {
        static let newsListTitle = "Breaking News"
        static let signInTitle = "Login"
    }
    
    struct Design {
        struct Colors {
            static let accent = #colorLiteral(red: 0.2549019608, green: 0.3098039216, blue: 0.8274509804, alpha: 1)
            static let primaryText = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            static let secondaryText = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            static let viewBackground = #colorLiteral(red: 0.1098039216, green: 0.1098039216, blue: 0.1176470588, alpha: 1)
            static let cellBackground = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.1039623331)
            static let clear = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
        }
        
        struct Fonts {
            static let primaryTextRegular = UIFont.systemFont(ofSize: 15.0, weight: .regular)
            static let primaryTextMedium = UIFont.systemFont(ofSize: 15.0, weight: .medium)
            static let primaryTextBold = UIFont.systemFont(ofSize: 15.0, weight: .bold)
            
            static let secondaryTextRegular = UIFont.systemFont(ofSize: 14.0, weight: .regular)
            static let secondaryTextMedium = UIFont.systemFont(ofSize: 14.0, weight: .medium)
            static let secondaryTextBold = UIFont.systemFont(ofSize: 14.0, weight: .bold)
            
        }
        
        struct Images {
            static let disclosureIndicator = UIImage(systemName: "chevron.right")
        }
    }
    
    struct Logics {
        struct Tags {
            static let loadingIndicator = -1
        }
        
        struct Dimensions {
            static let rowBaseHeight: CGFloat = 70.0
        }
    }
}

