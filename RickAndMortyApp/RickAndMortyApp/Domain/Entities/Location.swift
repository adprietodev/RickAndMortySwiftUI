//
//  Location.swift
//  RickAndMortyApp
//
//  Created by Adrian Prieto Villena on 19/6/24.
//

import Foundation

class Location {
    let id: Int
    let name: String
    var type: String
    var dimension: String
    var residents: [Int]
    var created: String
    var isFavorite: Bool

    init(id: Int, name: String, type: String, dimension: String, residents: [Int], created: String) {
        self.id = id
        self.name = name
        self.type = type
        self.dimension = dimension
        self.residents = residents
        self.created = created
        self.isFavorite = false
    }

    init(id: Int, name: String) {
        self.id = id
        self.name = name
        self.type = ""
        self.dimension = ""
        self.residents = []
        self.created = ""
        self.isFavorite = false
    }
}
