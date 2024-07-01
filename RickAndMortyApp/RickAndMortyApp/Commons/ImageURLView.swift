//
//  ImageURLView.swift
//  RickAndMortyApp
//
//  Created by Adrian Prieto Villena on 19/6/24.
//

import SwiftUI

struct ImageURLView: View {
    let character: Character
    let size: CGFloat

    var body: some View {
        AsyncImage(url: URL(string: character.image)) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .frame(width: size, height: size)
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: size, height: size)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    case .failure:
                        Image("characterPlaceholder")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.red)
                            .frame(width: size, height: size)
                    @unknown default:
                        EmptyView()
                    }
                }
    }
}
