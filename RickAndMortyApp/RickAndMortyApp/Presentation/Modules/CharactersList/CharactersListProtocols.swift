//
//  CharactersListProtocols.swift
//  RickAndMortyApp
//
//  Created by Adrian Prieto Villena on 18/6/24.
//

import Foundation

protocol CharactersListViewModelProtocol {
    var characters: [Character] { get set }
    var filteredCharacters: [Character] { get set }
    var isLoading: Bool { get set }
    var mainFilters: [String: Any] { get set }
    var isFiltering: Bool { get set }
    func loadNewPage()
    func setFavorite(at index: Int)
}
