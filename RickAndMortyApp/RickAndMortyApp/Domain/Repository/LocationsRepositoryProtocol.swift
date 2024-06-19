//
//  LocationsRepositoryProtocol.swift
//  RickAndMortyApp
//
//  Created by Adrian Prieto Villena on 19/6/24.
//

import Foundation

protocol LocationsRepositoryProtocol {
    func getLocations(with filters: [String: Any]) async throws -> [Location]
}
