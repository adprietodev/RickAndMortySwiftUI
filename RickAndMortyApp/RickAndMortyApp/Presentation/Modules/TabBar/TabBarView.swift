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
                    LocationsList()
                    .tabItem {
                        Text("Locations")
                        Image(systemName: "mappin.and.ellipse")
                    }
                    .tag(1)
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
