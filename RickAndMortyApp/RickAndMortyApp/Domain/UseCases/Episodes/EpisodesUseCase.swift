//
//  EpisodesUseCase.swift
//  RickAndMortyApp
//
//  Created by Adrian Prieto Villena on 28/6/24.
//

import Foundation

class EpisodesUseCase: EpisodesUseCaseProtocol {
    let repository: EpisodesRepositoryProtocol

    init(repository: EpisodesRepositoryProtocol) {
        self.repository = repository
    }

    // MARK: - Functions
    func getEpisodes(with filters: [String: Any]) async throws -> [Episode] {
        try await repository.getEpisodes(with: filters)
    }

    func getEpisodes(by ids: [Int]) async throws -> [Episode] {
        try await repository.getEpisodes(by: ids)
    }
}
