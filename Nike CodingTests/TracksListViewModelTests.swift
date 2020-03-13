//
//  TracksListViewModelTests.swift
//  Nike Coding
//
//  Created by Subba Nelakudhiti on 3/13/20.
//  Copyright © 2020 Subba Nelakudhiti. All rights reserved.
//

import XCTest

@testable import Nike_Coding

final class TracksListViewModelTests: XCTestCase {
    private var sut = TracksListViewModel()
    
    func testFetchAlbums() {
        // given
        sut.albumDetails = Album.sampleResponse1.feed!.results!
        // when
        sut.fetchAlbums()
        
        // then
        XCTAssertEqual(sut.albumDetails.count, 100)
        
    }
}

extension Album {
    static var sampleResponse1: Album {
        let returnValue: Album? = JsonLoad().getEntity(fromResource: "MockResponse")
        guard let valid = returnValue else {
            fatalError("Parse didn't work")
        }
        return valid
    }
}
