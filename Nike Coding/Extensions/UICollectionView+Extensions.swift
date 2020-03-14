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
    
    /// to register the cell to the collectionview, if you use this method no need to mention the cell identifier.
    /// this method will automatically will take care of everything
    /// for example, if you want to pass TrackListViewCell which is type of uicollectionviewcell,
    /// the give it's reuse identifier as "TrackListViewCell" and pass  "TrackListViewCell.self" to this method.
    /// - Parameter cellClass: we need to pass the collectionview cell name. then it'll take care of the reuse identifier and everything.
    func register<T: UICollectionViewCell>(_ cellClass: T.Type) {
        if Bundle.main.path(forResource: T.className, ofType: "nib") != nil {
            register(UINib(nibName: T.className, bundle: Bundle.main), forCellWithReuseIdentifier: T.className)
        } else {
            let reuseIdentifier = T.className
            register(cellClass, forCellWithReuseIdentifier: reuseIdentifier)
        }
    }
    
    /// To reuse the cell, we can use this method.
    /// no need to pass the reuseIdentifier and handle the optional stuff unlike regular method if you use this method
    /// - Parameter indexPath: pass the indexpath value
    func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T {
        let reuseIdentifier = T.className
        guard let cell = dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(reuseIdentifier)")
        }

        return cell
    }

}
