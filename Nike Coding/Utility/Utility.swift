//
//  Utility.swift
//  Nike Coding
//
//  Created by Subba Nelakudhiti on 3/13/20.
//  Copyright © 2020 Subba Nelakudhiti. All rights reserved.
//

import Foundation
import UIKit

class Utility {
    public class var isPhone: Bool {
        return UIDevice.current.userInterfaceIdiom == .phone
    }

    public class var isPad: Bool {
        return UIDevice.current.userInterfaceIdiom == .pad
    }

    public class func deviceType() -> String {
        return Utility.isPhone ? "iPhone" : "iPad"
    }
    
    /// To convert method into MMM dd, yyyy (Mar 22, 2020) format.
    /// - Parameters:
    ///   - date: pass the date value which you want to convert into String in string format
    ///   - format: mention the format in which your passing. If you didn't mention any type it by default takes the "yyyy-MM-dd'T'HH:mm:ssZ" format
    public class func formatDate(date: String, format: String = "yyyy-MM-dd'T'HH:mm:ssZ") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format // Input Formated
        let formatDate = dateFormatter.date(from: date)!
        dateFormatter.dateFormat = "MMM dd, yyyy" // Output Formated
        return dateFormatter.string(from: formatDate)
    }
}
