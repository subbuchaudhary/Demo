//
//  TracksListViewModel.swift
//  Nike Coding
//
//  Created by Subba Nelakudhiti on 3/13/20.
//  Copyright © 2020 Subba Nelakudhiti. All rights reserved.
//

import Foundation

class TracksListViewModel {

    var albumDetails: [Results] = [] {
        didSet {
            dataUpdated?(albumDetails)
        }
    }
    var isError: Bool = false
    var dataUpdated: (([Results]) -> Void)?


    func fetchAlbums() {
        NetworkManager.shared.fetchTrackList(urlString: Constants.rssUrlString, completion: { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                guard let results = response.feed?.results else { return }
                self.albumDetails = results
            case .failure( _):
                self.isError = true
            }
        })
    }
}
