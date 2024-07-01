//
//  LocationsUseCaseProtocol.swift
//  RickAndMortyApp
//
//  Created by Adrian Prieto Villena on 1/7/24.
//

import Foundation

protocol LocationsUseCaseProtocol {
    func getLocations(with filters: [String: Any]) async throws -> [Location]
}
