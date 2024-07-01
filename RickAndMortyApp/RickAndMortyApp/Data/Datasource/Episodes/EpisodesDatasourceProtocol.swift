//
//  EpisodesDatasourceProtocol.swift
//  RickAndMortyApp
//
//  Created by Adrian Prieto Villena on 19/6/24.
//

import Foundation

protocol EpisodesDatasourceProtocol {
    func getEpisodes(with filters: [String: Any]) async throws -> [EpisodeDTO]
    func getEpisodes(by ids: [Int]) async throws -> [EpisodeDTO] 
}
