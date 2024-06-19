//
//  LocationsDatasourceProtocol.swift
//  RickAndMortyApp
//
//  Created by Adrian Prieto Villena on 19/6/24.
//

import Foundation

protocol LocationsDatasourceProtocol {
    func getLocations(with filters: [String: Any]) async throws -> [LocationDTO]
}
