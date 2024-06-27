//
//  ImageURLView.swift
//  RickAndMortyApp
//
//  Created by Adrian Prieto Villena on 19/6/24.
//

import SwiftUI

struct ImageURLView: View {
    let character: Character

    var body: some View {
        AsyncImage(url: URL(string: character.image)) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .frame(width: 64, height: 64)
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 64, height: 64)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    case .failure:
                        Image("characterPlaceholder")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.red)
                            .frame(width: 64, height: 64)
                    @unknown default:
                        EmptyView()
                    }
                }
    }
}
