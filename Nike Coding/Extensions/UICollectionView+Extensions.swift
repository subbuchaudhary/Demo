//
//  UICollectionView+Extensions.swift
//  Nike Coding
//
//  Created by Subba Nelakudhiti on 3/13/20.
//  Copyright © 2020 Subba Nelakudhiti. All rights reserved.
//

import UIKit
import Foundation

extension UICollectionView {

    func reloadData(_ completion: @escaping (Bool) -> Void) {
        reloadData()
        performBatchUpdates(nil, completion: completion)
    }

    func register<T: UICollectionViewCell>(_ cellClass: T.Type) {
        if Bundle.main.path(forResource: T.className, ofType: "nib") != nil {
            register(UINib(nibName: T.className, bundle: Bundle.main), forCellWithReuseIdentifier: T.className)
        } else {
            let reuseIdentifier = T.className
            register(cellClass, forCellWithReuseIdentifier: reuseIdentifier)
        }
    }

    func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T {
        let reuseIdentifier = T.className
        guard let cell = dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(reuseIdentifier)")
        }

        return cell
    }

}
