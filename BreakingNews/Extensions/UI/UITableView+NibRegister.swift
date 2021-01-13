//
//  UITableViewCell+NibRegister.swift
//  BreakingNews
//
//  Created by Douglas Gehring on 12/01/21.
//  Copyright © 2021 Douglas Gehring. All rights reserved.
//

import UIKit

public protocol ClassNameProtocol {
    static var className: String { get }
    var className: String { get }
}

public extension ClassNameProtocol {
    static var className: String {
        return String(describing: self)
    }

    var className: String {
        return type(of: self).className
    }
}

extension NSObject: ClassNameProtocol {}

/*
 TableView extension:
 Used for nib register by class type
 */

extension UITableView {
    func register<T: UITableViewCell>(cellType: T.Type, bundle: Bundle? = nil) {
         let className = cellType.className
         let nib = UINib(nibName: className, bundle: bundle)
         register(nib, forCellReuseIdentifier: className)
     }
}
