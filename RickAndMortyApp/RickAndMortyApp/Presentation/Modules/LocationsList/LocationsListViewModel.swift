//
//  LocationsListViewModel.swift
//  RickAndMortyApp
//
//  Created by Adrian Prieto Villena on 1/7/24.
//

import Foundation

class LocationsListViewModel: ObservableObject {
    
    let locationsUseCase: LocationsUseCaseProtocol
    @Published var locations = [Location]()

    init(locationsUseCase: LocationsUseCaseProtocol) {
        self.locationsUseCase = locationsUseCase
        getLocations()
    }

    func getLocations() {
        Task {
            do {
                locations = try await locationsUseCase.getLocations(with: [:])
            } catch {
                
            }
        }
    }
}
