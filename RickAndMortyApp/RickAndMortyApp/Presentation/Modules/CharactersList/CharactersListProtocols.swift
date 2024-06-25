//
//  CharactersListProtocols.swift
//  RickAndMortyApp
//
//  Created by Adrian Prieto Villena on 18/6/24.
//

import SwiftUI

protocol CharactersListViewModelProtocol: ObservableObject {
    var characters: [Character] { get set }
    var filteredCharacters: [Character] { get set }
    var isLoading: Bool { get set }
    var mainFilters: [String: Any] { get set }
    var hasAdditionalFilters: Bool { get set }
    func checkAdditionalFilters()
    func loadNewPage()
    func searchByName(_ name: String)
    func updateFavourite(character: Character)
    func updateFilters(newFilters: [String: Any])
}

protocol CharactersViewDelegate {
    func setMainFilters(mainFilters: [String:Any])
}
