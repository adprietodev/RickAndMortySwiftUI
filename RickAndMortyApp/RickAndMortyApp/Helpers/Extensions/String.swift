//
//  String.swift
//  RickAndMortyApp
//
//  Created by Adrian Prieto Villena on 19/6/24.
//

import Foundation

extension String {
    func changeStringDate(to dateFormat: Constants.DateFormat) -> String {
        let dateFormatter = DateFormatter()
        let date = dateFormatter.date(from: self) ?? Date()
        dateFormatter.dateFormat = dateFormat.rawValue
        return dateFormatter.string(from: date)
    }
}
