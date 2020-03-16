//
//  Album.swift
//  Nike Coding
//
//  Created by Subba Nelakudhiti on 3/13/20.
//  Copyright © 2020 Subba Nelakudhiti. All rights reserved.
//

import Foundation
import SDWebImage

// MARK: - the only reason for making all the keys as optional is I don't want to break my model if backend fails to send any data

struct Album: Equatable {
    var feed: DataFeed?
}

struct DataFeed: Codable, Equatable {
    var title: String?
    var id: String?
    var author: Author?
    var links: [Links]?
    var copyright: String?
    var country: String?
    var icon: String?
    var updated: String?
    var results: [Results]?
}

struct Author: Codable, Equatable {
    var name: String?
    var uri: String?
}
struct Links: Codable, Equatable {
    var alternate: String?
}

struct Results: Codable, Equatable {
    var artistName: String?
    var id: String?
    var releaseDate: String?
    var name: String?
    var kind: String?
    var copyright: String?
    var artistId: String?
    var contentAdvisoryRating: String?
    var artistUrl: String?
    var artworkUrl100: String?
    var genres: [Genres]?
    var url: String?
}

struct Genres: Codable, Equatable {
    var genreId: String?
    var name: String?
    var url: String?
}

extension Album: Decodable {
    enum CodingKeys: String, CodingKey {
        case feed
    }
    
    init(from decoder: Decoder) throws {
        do {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            feed = try container.decodeIfPresent(DataFeed.self, forKey: .feed)
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
}

extension Results {
    var displayDate: String {
        var date = ""
        if let dateValue = releaseDate {
            date = Utility.formatDate(date: dateValue, format: "yyyy-MM-dd")
        }
        return "Released on \(date)"
    }
    
    var albumName: String {
        var albumName = ""
        if let name = name {
            albumName = name
        }
        return albumName
    }
    
    var artist: String {
        var artist = ""
        if let artistName = artistName {
            artist = artistName
        }
        return "Composed by \(artist)"
    }
    
    var singer: String {
        var name = ""
        if let artistName = artistName {
            name = artistName
        }
        return name
    }
    
    var copyRight: String {
        var copy = ""
        if let copyRight = copyright {
            copy = copyRight
        }
        return "Copy rights own by \(copy)"
    }
    
    var albumStoreUrl: String {
        var urlString = ""
        if let url = url {
            urlString = url
        }
        return urlString
    }
    
    var albumCoverArtUrl: String {
        var urlString = ""
        if let url = artworkUrl100 {
            urlString = url
        }
        return urlString
    }
}
