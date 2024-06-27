//
//  FiltersBuilder.swift
//  RickAndMortyApp
//
//  Created by Adrian Prieto Villena on 24/6/24.
//

import Foundation

class FiltersBuilder {
    func build(characterView: CharactersViewDelegate) -> FiltersView<FiltersViewModel> {
        let remoteCharactersDatasource = ApiRickAndMoryCharactersDatasource()
        let localCharactersDatasource = LocalRickAndMortyCharactersDatasource()
        let charactersRepository = CharactersRepository(remoteDatasource: remoteCharactersDatasource, localDatasource: localCharactersDatasource)
        let charactersUseCase = CharactersUseCase(repository: charactersRepository)

        let viewModel = FiltersViewModel(charactersUseCase: charactersUseCase)
        var view = FiltersView(viewModel: viewModel)
        view.delegate = characterView
        return view
    }
}
