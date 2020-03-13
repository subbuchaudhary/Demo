//
//  UIViewController+Extensions.swift
//  Nike Coding
//
//  Created by Subba Nelakudhiti on 3/13/20.
//  Copyright © 2020 Subba Nelakudhiti. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    /// To present UIViewController full screen we can use this method.
    /// This method will fire viewWillAppear and viewDidAppear when dismissed
    /// - Parameters:
    ///   - viewController: pass whatever the viewcontroller you want to present from
    ///   - animated: Pass Boolean value to handle animations. If you didn't pass anything by default it'll take true
    ///   - completion: You can handle the chunk of the code you need to do when the viewcontroller is presented
    public func presentFullScreen(_ viewController: UIViewController, animated: Bool = true, completion: (() -> Void)? = nil) {
        viewController.modalPresentationStyle = .fullScreen
        present(viewController, animated: animated, completion: completion)
    }
    
    /// To present UIViewController over full screen we can use this method.
    /// This method will fire viewWillAppear and viewDidAppear when dismissed
    /// - Parameters:
    ///   - viewController: pass whatever the viewcontroller you want to present from
    ///   - animated: Pass Boolean value to handle animations. If you didn't pass anything by default it'll take true
    ///   - completion: You can handle the chunk of the code you need to do when the viewcontroller is presented
    public func presentOverFullScreen(_ viewController: UIViewController, animated: Bool = true, completion: (() -> Void)? = nil) {
        viewController.modalPresentationStyle = .overFullScreen
        present(viewController, animated: animated, completion: completion)
    }
}
