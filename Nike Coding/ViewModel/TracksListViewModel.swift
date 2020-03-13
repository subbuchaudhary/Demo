//
//  TracksListViewModel.swift
//  Nike Coding
//
//  Created by Subba Nelakudhiti on 3/13/20.
//  Copyright © 2020 Subba Nelakudhiti. All rights reserved.
//

import Foundation

class TracksListViewModel {

    // MARK: - Public Properties
    var albumDetails: [Results] = [] {
        didSet {
            dataUpdated?(albumDetails)
        }
    }
    var dataUpdated: (([Results]) -> Void)?

    // MARK: - Public Methods
    func fetchAlbums() {
        NetworkManager.shared.fetchTrackList(urlString: Constants.rssUrlString, completion: { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                guard let results = response.feed?.results else { return }
                self.albumDetails = results
            case .failure(let err):
                print("failed with the error: \(err.localizedDescription)")
            }
        })
    }
}
