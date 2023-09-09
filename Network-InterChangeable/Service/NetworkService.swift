//
//  NetworkService.swift
//  Network-InterChangeable
//
//  Created by Terry Jason on 2023/9/10.
//

import Foundation

protocol NetworkService {
    func download(_ resource: String) async throws -> [User]
    var type: String { get }
}
