//
//  CharactersListBuilder.swift
//  RickAndMortyApp
//
//  Created by Adrian Prieto Villena on 18/6/24.
//

import SwiftUI

class CharactersListBuilder {
    func build() -> CharacterListView<CharactersListViewModel> {
        let charactersDatasource = ApiRickAndMoryCharactersDatasource()
        let charactersRepository = CharactersRepository(datasource: charactersDatasource)
        let charactersUseCase = CharactersUseCase(repository: charactersRepository)
        
        let viewModel = CharactersListViewModel(charactersUseCase: charactersUseCase)
        let view = CharacterListView(viewModel: viewModel)
        return view
    }
}
