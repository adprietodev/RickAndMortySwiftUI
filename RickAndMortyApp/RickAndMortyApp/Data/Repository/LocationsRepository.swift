//
//  LocationsRepository.swift
//  RickAndMortyApp
//
//  Created by Adrian Prieto Villena on 19/6/24.
//

import Foundation

class LocationsRepository: LocationsRepositoryProtocol {
    // MARK: - Properties
    let datasource: LocationsDatasourceProtocol

    init(datasource: LocationsDatasourceProtocol) {
        self.datasource = datasource
    }

    // MARK: - Functions
    func getLocations(with filters: [String: Any]) async throws -> [Location] {
        let locationsDTO = try await datasource.getLocations(with: filters)
        return locationsDTO.map { $0.toDomain() }
    }
}

fileprivate extension LocationDTO {
    func toDomain() -> Location {
        Location(
            id: self.id,
            name: self.name,
            type: self.type,
            dimension: self.dimension,
            residents: self.residents.compactMap {
                Int($0.split(separator: "/").last ?? "0") ?? 0
            },
            created: self.created
        )
    }
}
