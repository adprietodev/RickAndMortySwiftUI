//
//  EpisodesUseCaseProtocol.swift
//  RickAndMortyApp
//
//  Created by Adrian Prieto Villena on 28/6/24.
//

import Foundation

protocol EpisodesUseCaseProtocol {
    func getEpisodes(with filters: [String: Any]) async throws -> [Episode]
    func getEpisodes(by ids: [Int]) async throws -> [Episode]
}
