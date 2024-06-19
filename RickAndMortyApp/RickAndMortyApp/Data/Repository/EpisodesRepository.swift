//
//  EpisodesRepository.swift
//  RickAndMortyApp
//
//  Created by Adrian Prieto Villena on 19/6/24.
//

import Foundation

// TODO: - Protocol
class EpisodesRepository {
    // MARK: - Properties
    let episodesDatasource: EpisodesDatasourceProtocol

    init(episodesDatasource: EpisodesDatasourceProtocol) {
        self.episodesDatasource = episodesDatasource
    }

    // MARK: - Functions
    // TODO: - Protocol
    func getEpisodes(with filters: [String: Any]) async throws {
        let episodesDTO = try await episodesDatasource.getEpisodes(with: filters)
        // TODO: - toDomain
        // TODO: - Return Episode
    }
}
