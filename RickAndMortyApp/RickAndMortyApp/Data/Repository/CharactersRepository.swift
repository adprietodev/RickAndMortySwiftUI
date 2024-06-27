//
//  CharactersRepository.swift
//  RickAndMortyApp
//
//  Created by Adrian Prieto Villena on 19/6/24.
//

import Foundation

class CharactersRepository: CharactersRepositoryProtocol {
    // MARK: - Properties
    let remoteDatasource: RemoteCharactersDatasourceProtocol
    let localDatasource: LocalCharactersDatasourceProtocol

    init(remoteDatasource: RemoteCharactersDatasourceProtocol, localDatasource: LocalCharactersDatasourceProtocol) {
        self.remoteDatasource = remoteDatasource
        self.localDatasource = localDatasource
    }

    // MARK: - Functions
    func getCharacters(with filters: [String: Any]) async throws -> [Character] {
        let charactersDTO = try await remoteDatasource.getCharacters(with: filters)
        return charactersDTO.map { $0.toDomain() }
    }

    func getFavouriteCharactersIDs() throws -> [Int] {
        try localDatasource.getFavouriteCharactersIDs()
    }
    func setFavoriteCharacter(by id: Int, isFavourite: Bool) throws {
        try localDatasource.setFavoriteCharacter(by: id, isFavourite: isFavourite)
    }

    func getCountOfTotalCharacters(with filters: [String: Any]) async throws -> Int {
        try await remoteDatasource.getCountOfTotalCharacters(with: filters)
    }
}

fileprivate extension CharacterDTO {
    func toDomain() -> Character {
        Character(
            id: self.id,
            name: self.name,
            status: Constants.Status(rawValue: self.status) ?? .unknown,
            species: self.species,
            type: self.type,
            gender: Constants.Gender(rawValue: self.gender) ?? .unknown,
            origin: Location(
                id: Int(self.origin.url.split(separator: "/").last ?? "0") ?? 0,
                name: self.origin.name
            ),
            location: Location(
                id: Int(self.location.url.split(separator: "/").last ?? "0") ?? 0,
                name: self.location.name
            ),
            image: self.image,
            episodes: self.episodes?.compactMap {
                Int($0.split(separator: "/").last ?? "0")
            } ?? [],
            created: self.created
        )
    }
}
