//
//  Constants.swift
//  RickAndMortyApp
//
//  Created by Adrian Prieto Villena on 19/6/24.
//

import Foundation

struct Constants {
    
    enum URLs: String {
        case baseURL = "https://rickandmortyapi.com/api"
        case charactersEndpoint = "/character?"
        case locationsEndpoint = "/location?"
        case episodesEndpoint = "/episode?"

        var fullURL: String {
            "\(URLs.baseURL.rawValue)\(self.rawValue)"
        }
    }

    enum QueryParams: String, CaseIterable, Identifiable {
        case page = "page"
        case name = "name"
        case status = "status"
        case species = "species"
        case type = "type"
        case gender = "gender"

        var id: String { self.rawValue }
    }

    enum Status: String, CaseIterable, Identifiable {
        case alive = "Alive"
        case dead = "Dead"
        case unknown = "unknown"
        case none = "none"

        var id: String { self.rawValue }
    }

    enum Gender: String, CaseIterable, Identifiable {
        case female = "Female"
        case male = "Male"
        case genderless = "Genderless"
        case unknown = "unknown"
        case none = "none"

        var id: String { self.rawValue }
    }

    enum DateFormat: String {
        case createdRickAndMortyAPI = "yyyy-MM-dd'T'HH:mm:ss.SSSXXXXX"
        case shortMonthDayYear = "MMM d, yyyy"
    }

    enum APIError: Error {
        case invalidURL
        case requestFailed
        case responseUnsuccessfil(statusCode: Int)
        case invalidData
        case jsonParsingFailure
        case networkUnavailable
    }
}
