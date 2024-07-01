//
//  TabBarView.swift
//  RickAndMortyApp
//
//  Created by Adrian Prieto Villena on 18/6/24.
//

import SwiftUI

struct TabBarView: View {
    @State var selectedTab = 0
    @State var searchNameTextField = ""

    init() {
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        UITabBar.appearance().standardAppearance = tabBarAppearance
    }

    var body: some View {
            ZStack(alignment: .bottom) {
                TabView(selection: $selectedTab) {
                    CharactersListBuilder().build()
                    .tabItem {
                        Text("Characters")
                        Image(systemName: "person.fill")
                    }
                    .tag(0)
                    LocationsListBuilder().build()
                    .tabItem {
                        Text("Locations")
                        Image(systemName: "globe")
                    }
                    .tag(1)
                    EpisodesListBuilder().build()
                    .tabItem {
                        Text("Episodes")
                        Image(systemName: "play.rectangle.fill")
                    }
                    .tag(2)
                }
                .background(.red)
                .tint(.primaryGreen)
                .preferredColorScheme(.dark)
            }
    }
}

#Preview {
    TabBarView()
}
