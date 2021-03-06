//
//  TracksListViewController.swift
//  Nike Coding
//
//  Created by Subba Nelakudhiti on 3/13/20.
//  Copyright © 2020 Subba Nelakudhiti. All rights reserved.
//

import UIKit
import SDWebImage

class TracksListViewController: UIViewController {
    
    // MARK: - Private Properties
    private let viewModel = TracksListViewModel()
    private lazy var tracksListView: UICollectionView = UICollectionView()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchAlbums()
        viewModel.dataUpdated = { [weak self] _ in
            DispatchQueue.main.async {
                self?.tracksListView.reloadData()
            }
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUI()
    }
}

// MARK: - Private Methods
private extension TracksListViewController {
    func setupUI() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)

        tracksListView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        tracksListView.dataSource = self
        tracksListView.delegate = self
        tracksListView.register(TrackListViewCell.self)
        tracksListView.backgroundColor = UIColor.white
        tracksListView.autoresizingMask = [.flexibleHeight]
        self.view.addSubview(tracksListView)
    }
}

// MARK: - Collectionview Delegate Methods
extension TracksListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let viewController: TrackDetailsViewController = storyboard!.instantiateViewController(identifier: "TrackDetailsViewController")
        viewController.dataFeed = viewModel.albumDetails[indexPath.row]
        self.presentOverFullScreen(viewController, animated: false)
    }
}

// MARK: - CollectionView DataSource Methods
extension TracksListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (viewModel.albumDetails.count > 0 ) ? viewModel.albumDetails.count : 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: TrackListViewCell = collectionView.dequeueReusableCell(for: indexPath)
        let result = viewModel.albumDetails[indexPath.row]

        cell.albumName.text = result.albumName
        cell.artistName.text = result.singer
        cell.albumCoverPic.sd_setImage(with: URL(string: result.albumCoverArtUrl), placeholderImage: UIImage(named: "Music"))
        return cell
    }

}

// MARK: - CollectionView Delegate FlowLayout Methods
extension TracksListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if Utility.isPad {
            return CGSize(width: (self.view.frame.size.width - 20)/2, height: 180)
        }
        return CGSize(width: self.view.frame.size.width, height: 180)
    }
}
