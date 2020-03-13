//
//  NetworkManager.swift
//  Nike Coding
//
//  Created by Subba Nelakudhiti on 3/13/20.
//  Copyright © 2020 Subba Nelakudhiti. All rights reserved.
//

import Foundation

class NetworkManager: NSObject {

    static let shared = NetworkManager()

    private var urlSession = URLSession.shared

    typealias completionHandler = (Result<Album, Error>) -> Void

    /// - Call this method to make the network call to fetch the tracks list
    /// - Parameters:
    ///   - urlString: pass the url in the string format
    ///   - completion: handles the success and failure
    func fetchTrackList(urlString: String, completion: @escaping completionHandler) {
        guard let url = URL(string: urlString) else {
            return
        }
        urlSession.dataTask(with: url, completionHandler: { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else { return }

            do {
                let albumModel = try JSONDecoder().decode(Album.self, from: data)
                completion(.success(albumModel))
            } catch let err {
                completion(.failure(err))
            }
        }).resume()
    }
}
