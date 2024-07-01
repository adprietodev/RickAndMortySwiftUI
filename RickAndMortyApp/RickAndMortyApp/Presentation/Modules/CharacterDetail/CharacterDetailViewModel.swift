//
//  CharacterDetailViewModel.swift
//  RickAndMortyApp
//
//  Created by Adrian Prieto Villena on 28/6/24.
//

import SwiftUI

class CharacterDetailViewModel: ObservableObject {
    // MARK: - Properties
    let charactersUseCase: CharactersUseCaseProtocol
    let episodesUseCase: EpisodesUseCaseProtocol

    @Published var character: Character
    @Published var episodes = [Episode]()

    init(character: Character, charactersUseCase: CharactersUseCaseProtocol, episodesUseCase: EpisodesUseCaseProtocol) {
        self.character = character
        self.charactersUseCase = charactersUseCase
        self.episodesUseCase = episodesUseCase
        getEpisodes(by: character.episodes)
    }

    // MARK: - Functions
    @MainActor
    func updateFavourite() {
        do {
            try charactersUseCase.setFavoriteCharacter(by: character.id, isFavourite: character.isFavorite)
        } catch {
            print(error)
        }
    }

    func getEpisodes(by ids: [Int]) {
        Task {
            do {
                episodes = try await episodesUseCase.getEpisodes(by: ids)
            } catch {
                print(error)
            }
        }
    }
}

