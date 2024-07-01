//
//  EpisodesListViewModel.swift
//  RickAndMortyApp
//
//  Created by Adrian Prieto Villena on 1/7/24.
//

import Foundation

class EpisodesListViewModel: ObservableObject {
    let episodesUseCase: EpisodesUseCaseProtocol
    @Published var episodes = [Episode]()

    init(episodesUseCase: EpisodesUseCaseProtocol) {
        self.episodesUseCase = episodesUseCase
        getEpisodes()
    }

    func getEpisodes() {
        Task {
            do {
                episodes = try await episodesUseCase.getEpisodes(with: [:])
            } catch {
                
            }
        }
    }
}
