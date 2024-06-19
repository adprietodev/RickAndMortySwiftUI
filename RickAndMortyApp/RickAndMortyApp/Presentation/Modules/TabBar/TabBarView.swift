//
//  TabBarView.swift
//  RickAndMortyApp
//
//  Created by Adrian Prieto Villena on 18/6/24.
//

import SwiftUI

struct TabBarView: View {
    @State var selectedTab = 0

    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selectedTab) {
                NavigationStack() {
                    CharactersListBuilder().build()
                }
                .tabItem {
                    Text("Characters")
                    Image(systemName: "person.fill")
                }
                .tag(0)
                NavigationStack {
                    LocationsList()
                }
                .tabItem {
                    Text("Locations")
                    Image(systemName: "mappin.and.ellipse")
                }
                .tag(1)
            }
            .tint(.cyan)
        }
        .preferredColorScheme(.dark)
        
    }
}

#Preview {
    TabBarView()
}
