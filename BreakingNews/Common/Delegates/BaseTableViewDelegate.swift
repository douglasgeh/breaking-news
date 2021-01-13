//
//  BaseTableViewDelegate.swift
//  BreakingNews
//
//  Created by Douglas Gehring on 12/01/21.
//  Copyright © 2021 Douglas Gehring. All rights reserved.
//

import UIKit

class BaseTableViewDelegate: NSObject, UITableViewDelegate {
   
    let heightForRow: CGFloat
    
    init(heightForRow: CGFloat = AppConstants.Logics.Dimensions.rowBaseHeight) {
        self.heightForRow = heightForRow
        super.init()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.heightForRow
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
}
