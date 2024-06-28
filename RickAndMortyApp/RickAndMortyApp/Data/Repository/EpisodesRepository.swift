//
//  EpisodesRepository.swift
//  RickAndMortyApp
//
//  Created by Adrian Prieto Villena on 19/6/24.
//

import Foundation

class EpisodesRepository: EpisodesRepositoryProtocol {
    // MARK: - Properties
    let datasource: EpisodesDatasourceProtocol

    init(datasource: EpisodesDatasourceProtocol) {
        self.datasource = datasource
    }

    // MARK: - Functions
    func getEpisodes(with filters: [String: Any]) async throws -> [Episode] {
        let episodesDTO = try await datasource.getEpisodes(with: filters)
        return episodesDTO.map { $0.toDomain() }
    }

    func getEpisodes(by ids: [Int]) async throws -> [Episode]  {
        let episodesDTO = try await datasource.getEpisodes(by: ids)
        return episodesDTO.map { $0.toDomain() }
    }
}

fileprivate extension EpisodeDTO {
    func toDomain() -> Episode {
        Episode(
            id: self.id,
            name: self.name,
            airDate: self.airDate,
            episode: self.episode,
            characters: self.characters.compactMap {
                Int( $0.split(separator: "/").last ?? "0")
            },
            created: self.created
        )
    }
}
