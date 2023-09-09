//
//  Localservice.swift
//  Network-InterChangeable
//
//  Created by Terry Jason on 2023/9/10.
//

import Foundation

class Localservice: NetworkService {
    
    var type: String = "Localservice"
    
    func download(_ resource: String) async throws -> [User] {
        
        guard let path = Bundle.main.path(forResource: resource, ofType: "json") else {
            fatalError("Resourse not found")
        }
        
        let data = try Data(contentsOf: URL(filePath: path))
        
        return try JSONDecoder().decode([User].self, from: data)
        
    }
    
}
