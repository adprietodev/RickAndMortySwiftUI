//
//  EpisodesRepositoryProtocol.swift
//  RickAndMortyApp
//
//  Created by Adrian Prieto Villena on 19/6/24.
//

import Foundation

protocol EpisodesRepositoryProtocol {
    func getEpisodes(with filters: [String: Any]) async throws -> [Episode]
    func getEpisodes(by ids: [Int]) async throws -> [Episode] 
}
