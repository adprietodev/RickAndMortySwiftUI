//
//  CharacterDetailBuilder.swift
//  RickAndMortyApp
//
//  Created by Adrian Prieto Villena on 28/6/24.
//

import Foundation

class CharacterDetailBuilder {
    func build(character: Character, delegate: CharacterFavouriteDelegate) -> CharacterDetailView<CharacterDetailViewModel> {
        let remoteCharactersDatasource = ApiRickAndMoryCharactersDatasource()
        let localCharactersDatasource = LocalRickAndMortyCharactersDatasource()
        let charactersRepository = CharactersRepository(remoteDatasource: remoteCharactersDatasource, localDatasource: localCharactersDatasource)
        let charactersUseCase = CharactersUseCase(repository: charactersRepository)

        let remoteEpisodesDatasource = RemoteEpisodesDatasource()
        let episodesRepository = EpisodesRepository(datasource: remoteEpisodesDatasource)
        let episodesUseCase = EpisodesUseCase(repository: episodesRepository)
        
        let viewModel = CharacterDetailViewModel(character: character, charactersUseCase: charactersUseCase, episodesUseCase: episodesUseCase)
        var view = CharacterDetailView(viewModel: viewModel)
        view.delegate = delegate
        return view
    }
}
