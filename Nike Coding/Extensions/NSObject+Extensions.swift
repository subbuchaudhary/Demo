//
//  NSObject+Extensions.swift
//  Nike Coding
//
//  Created by Subba Nelakudhiti on 3/13/20.
//  Copyright © 2020 Subba Nelakudhiti. All rights reserved.
//

import Foundation

extension NSObject {
    
    public var className: String {
        return String(describing: type(of: self)).components(separatedBy: ".").last ?? NSStringFromClass(self.classForCoder)
    }
    
    public static var className: String {
        return String(describing: self).components(separatedBy: ".").last ?? ""
    }
}
