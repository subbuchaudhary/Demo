//
//  JsonLoad.swift
//  Nike Coding
//
//  Created by Subba Nelakudhiti on 3/13/20.
//  Copyright © 2020 Subba Nelakudhiti. All rights reserved.
//

import Foundation

class JsonLoad {
    
    func getEntity<T>(fromResource resource: String) -> T? where T: Decodable {
        let data = self.getData(forResource: resource)
        return try? JSONDecoder().decode(T.self, from: data)
    }

    func getData(forResource resource: String) -> Data {
        let bundle = Bundle.init(for: type(of: self))

        guard let filePath = bundle.url(forResource: resource, withExtension: "json") else {
            fatalError("\(resource).json does not exist")
        }
        guard let data = try? Data(contentsOf: filePath) else {
            fatalError("Could not convert the contents of \(filePath) to Data")
        }

        return data
    }
}
