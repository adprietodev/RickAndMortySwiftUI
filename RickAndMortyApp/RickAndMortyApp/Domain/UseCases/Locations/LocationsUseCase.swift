//
//  LocationsUseCase.swift
//  RickAndMortyApp
//
//  Created by Adrian Prieto Villena on 1/7/24.
//

import Foundation

class LocationsUseCase: LocationsUseCaseProtocol {
    let repository: LocationsRepositoryProtocol

    init(repository: LocationsRepositoryProtocol) {
        self.repository = repository
    }

    func getLocations(with filters: [String: Any]) async throws -> [Location] {
        try await repository.getLocations(with: filters)
    }
}
