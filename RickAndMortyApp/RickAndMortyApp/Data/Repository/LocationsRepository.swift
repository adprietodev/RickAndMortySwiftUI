//
//  LocationsRepository.swift
//  RickAndMortyApp
//
//  Created by Adrian Prieto Villena on 19/6/24.
//

import Foundation

// TODO: - Protocol
class LocationsRepository {
    // MARK: - Properties
    let locationsDatasource: LocationsDatasourceProtocol

    init(locationsDatasource: LocationsDatasourceProtocol) {
        self.locationsDatasource = locationsDatasource
    }

    // MARK: - Functions
    // TODO: - Entity Location
    func getLocations(with filters: [String: Any]) async throws {
        let locationsDTO = try await locationsDatasource.getLocations(with: filters)
        // TODO: - toDomain
        // TODO: - Return Locations
    }
}
