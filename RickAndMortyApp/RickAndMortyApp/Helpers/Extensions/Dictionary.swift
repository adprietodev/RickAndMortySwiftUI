//
//  String.swift
//  RickAndMortyApp
//
//  Created by Adrian Prieto Villena on 19/6/24.
//

import Foundation

extension Dictionary where Key == String, Value == Any {
    func toQueryString() -> String {
        self.map { "\($0.key)=\($0.value)"}.joined(separator: "&")
    }

    func containsAdditionalFilter(keys: [String]) -> Bool {
        return keys.contains(where: { self.keys.contains($0) })
    }
}
