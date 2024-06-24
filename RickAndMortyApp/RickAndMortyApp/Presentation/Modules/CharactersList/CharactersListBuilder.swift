//
//  CharactersListBuilder.swift
//  RickAndMortyApp
//
//  Created by Adrian Prieto Villena on 18/6/24.
//

import SwiftUI

class CharactersListBuilder {
    func build() -> CharacterListView<CharactersListViewModel> {
        let remoteCharactersDatasource = ApiRickAndMoryCharactersDatasource()
        let localCharactersDatasource = LocalRickAndMortyCharactersDatasource()
        let charactersRepository = CharactersRepository(remoteDatasource: remoteCharactersDatasource, localDatasource: localCharactersDatasource)
        let charactersUseCase = CharactersUseCase(repository: charactersRepository)
        
        let viewModel = CharactersListViewModel(charactersUseCase: charactersUseCase)
        let view = CharacterListView(viewModel: viewModel)
        return view
    }
}
