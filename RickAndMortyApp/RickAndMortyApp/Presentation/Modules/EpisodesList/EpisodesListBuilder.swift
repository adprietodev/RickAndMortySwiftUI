//
//  EpisodesListBuilder.swift
//  RickAndMortyApp
//
//  Created by Adrian Prieto Villena on 1/7/24.
//

import Foundation

class EpisodesListBuilder {
    func build() -> EpisodesListView<EpisodesListViewModel> {
        let remoteEpisodesDatasource = RemoteEpisodesDatasource()
        let episodesRepository = EpisodesRepository(datasource: remoteEpisodesDatasource)
        let episodesUseCase = EpisodesUseCase(repository: episodesRepository)
        
        let viewModel = EpisodesListViewModel(episodesUseCase: episodesUseCase)
        let view = EpisodesListView(viewModel: viewModel)
        return view
    }
}
