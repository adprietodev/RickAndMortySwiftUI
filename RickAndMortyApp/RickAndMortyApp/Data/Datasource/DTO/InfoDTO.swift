//
//  Pagination.swift
//  RickAndMortyApp
//
//  Created by Adrian Prieto Villena on 19/6/24.
//

import Foundation

struct InfoDTO: Codable {
    var count: Int
    var pages: Int
    var next: String?
    var prev: String?
}
