//
//  RemoteLocationsDatasource.swift
//  RickAndMortyApp
//
//  Created by Adrian Prieto Villena on 19/6/24.
//

import Foundation

class RemoteLocationsDatasource: LocationsDatasourceProtocol {
    // MARK: - Properties
    let locationsURL = Constants.URLs.locationsEndpoint.fullURL

    // MARK: - Functions
    func getLocations(with filters: [String: Any]) async throws -> [LocationDTO] {
        let query = filters.toQueryString()

        guard let url = URL(string: "\(locationsURL)?\(query)") else {
            throw Constants.APIError.invalidURL
        }

        let request = URLRequest(url: url)
        let (data, response ): (Data, URLResponse)

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

        let locationsPagination = try JSONDecoder().decode(LocationsPaginationDTO.self, from: data)
        return locationsPagination.results
    }
}
