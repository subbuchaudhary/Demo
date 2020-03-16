//
//  TrackDetailsViewController.swift
//  Nike Coding
//
//  Created by Subba Nelakudhiti on 3/13/20.
//  Copyright © 2020 Subba Nelakudhiti. All rights reserved.
//

import UIKit
import SDWebImage

class TrackDetailsViewController: UIViewController {
    
    @IBOutlet weak var heightValue: NSLayoutConstraint!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var albumImage: UIImageView!
    @IBOutlet weak var albumName: UILabel!
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var copyright: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    
    var dataFeed: Results?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }

    private func setupUI() {
        self.heightValue.constant = Utility.isPad ? 113 : 56
        if let urlString = dataFeed?.albumCoverArtUrl {
            albumImage.downloadImage(from: urlString)
        }
        self.albumName.text = dataFeed?.albumName ?? "--"
        self.artistName.text = dataFeed?.artist ?? "--"
        self.copyright.text = dataFeed?.copyRight ?? "--"
        self.releaseDate.text = dataFeed?.displayDate ?? "--"
    }
    
    @IBAction func navigateBack(_ sender: Any) {
        self.dismiss(animated: false)
    }
    
    @IBAction func navigateToAppStore(_ sender: Any) {
        // App Store URL.
        guard let appStoreLink = dataFeed?.albumStoreUrl else { return }
         
        if let url = URL(string: appStoreLink), UIApplication.shared.canOpenURL(url) {
           // Attempt to open the URL.
           UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }

    }
}


