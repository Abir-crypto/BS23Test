//
//  ReadJsonFile.swift
//  BS23Test
//
//  Created by Abdullah All Abir on 21/6/24.
//

import Foundation

struct LandMark: Codable {
    let name: String
    let id: Int
    let subtitle: String
    let imageName: String
}

class ReadJsonFile{
    static let shared = ReadJsonFile()
    
    private init(){
        
    }
    
    func readUserFromBundle() throws -> [LandMark]? {
        guard let url = Bundle.main.url(forResource: "landmarkData", withExtension: "json") else {
            debugPrint("Url Not Found")
            return nil
        }
        return try readJSONFile(with: url)
    }
    
    func readJSONFile<T: Decodable>(with url: URL) throws -> T {
        let data = try Data(contentsOf: url)
        return try JSONDecoder().decode(T.self, from: data)
    }

    
}
