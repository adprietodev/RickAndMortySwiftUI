//
//  RemoteCharactersDatasource.swift
//  RickAndMortyApp
//
//  Created by Adrian Prieto Villena on 19/6/24.
//

import Foundation

class ApiRickAndMoryCharactersDatasource: RemoteCharactersDatasourceProtocol {
    // MARK: - Properties
    let charactersURL = Constants.URLs.charactersEndpoint.fullURL

    // MARK: - Functions
    func getCharacters(with filters: [String: Any]) async throws -> [CharacterDTO] {
        let query = filters.toQueryString()

        guard let url = URL(string: "\(charactersURL)\(query)") else {
            throw Constants.APIError.invalidURL
        }

        let request = URLRequest(url: url)
        let (data, response): (Data, URLResponse)

        do {
            (data, response) = try await URLSession.shared.data(for: request)
        } catch {
            throw Constants.APIError.requestFailed
        }
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            if let httpResponse = response as? HTTPURLResponse {
                throw Constants.APIError.responseUnsuccessfil(statusCode: httpResponse.statusCode)
            } else {
                throw Constants.APIError.responseUnsuccessfil(statusCode: 0)
            }
        }

        let charactersPagination = try JSONDecoder().decode(CharactersPaginationDTO.self, from: data)
        return charactersPagination.results
    }
}
