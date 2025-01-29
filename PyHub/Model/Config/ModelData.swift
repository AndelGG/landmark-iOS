//
//  ModelData.swift
//  PyHub
//
//  Created by Дмитрий Поповский on 2025-01-28.
//

import Foundation

var landmarks: [Landmark] = load("landmarkData.json")

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError("File '\(filename)' not found")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("File '\(filename)' not load")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("File '\(filename)' not parse as \(T.self):\n\(error)")
    }
}
