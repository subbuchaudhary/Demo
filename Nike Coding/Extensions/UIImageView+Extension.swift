//
//  UIImageView+Extension.swift
//  Nike Coding
//
//  Created by Subba Nelakudhiti on 3/15/20.
//  Copyright © 2020 Subba Nelakudhiti. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    /// To download the image from the url and assign image to the imageview
    /// - Parameter urlString: pass your url in string format
    func downloadImage(from urlString: String) {
        guard let url = URL(string: urlString) else { return }
        DispatchQueue.global().async { [weak self]  in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
