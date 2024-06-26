//
//  RemoteEpisodesDatasource.swift
//  RickAndMortyApp
//
//  Created by Adrian Prieto Villena on 19/6/24.
//

import Foundation

class RemoteEpisodesDatasource: EpisodesDatasourceProtocol {
    // MARK: - Properties
    let episodesURL = Constants.URLs.episodesEndpoint.fullURL

    // MARK: - Functions
    func getEpisodes(with filters: [String: Any]) async throws -> [EpisodeDTO] {
        let query = filters.toQueryString()

        guard let url = URL(string: "\(episodesURL)?\(query)") else {
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

        let episodesPagination = try JSONDecoder().decode(EpisodesPaginationDTO.self, from: data)
        return episodesPagination.results
    }

    func getEpisodes(by ids: [Int]) async throws -> [EpisodeDTO] {
        let idsString = ids.map { String($0) }.joined(separator: ",")

        guard let url = URL(string: "\(episodesURL)\(idsString)") else {
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

        let episodesDTO = try JSONDecoder().decode([EpisodeDTO].self, from: data)
        return episodesDTO
    }
}
