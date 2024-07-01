//
//  LocationsListBuilder.swift
//  RickAndMortyApp
//
//  Created by Adrian Prieto Villena on 1/7/24.
//

import Foundation

class LocationsListBuilder {
    func build() -> LocationsListView<LocationsListViewModel> {
        let remoteLocationsDatasource = RemoteLocationsDatasource()
        let locationsRepository = LocationsRepository(datasource: remoteLocationsDatasource)
        let locationsUseCase = LocationsUseCase(repository: locationsRepository)
    
        let viewModel = LocationsListViewModel(locationsUseCase: locationsUseCase)
        let view = LocationsListView(viewModel: viewModel)
        return view
    }
}
