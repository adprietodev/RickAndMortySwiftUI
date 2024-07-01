//
//  RickAndMortyAppApp.swift
//  RickAndMortyApp
//
//  Created by Adrian Prieto Villena on 18/6/24.
//

import SwiftUI

@main
struct RickAndMortyAppApp: App {

    init() {
        let appear = UINavigationBarAppearance()

            let atters: [NSAttributedString.Key: Any] = [
                .font: UIFont.bangers(size: 36)!,
                .foregroundColor: UIColor.primaryGreen
            ]

            appear.largeTitleTextAttributes = atters
            appear.titleTextAttributes = atters
            UINavigationBar.appearance().standardAppearance = appear
    }
    var body: some Scene {
        WindowGroup {
            TabBarView()
        }
    }
}
