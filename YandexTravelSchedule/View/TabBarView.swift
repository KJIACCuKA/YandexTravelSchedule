//
//  TabBarView.swift
//  YandexTravelSchedule
//
//  Created by Никита Козловский on 22.11.2024.
//

import SwiftUI

struct TabBarView: View {
    
    @State var selectedTab: String = "1"
    
    var body: some View {
        TabView(selection: $selectedTab) {
            ContentView()
                .tag("1")
                .tabItem {
                    Image(systemName: "arrow.up.message.fill")
                    .foregroundColor(.black)
            }
            SettingsView()
                .tag("2")
                .tabItem {
                    Image(systemName: "gearshape.fill")
            }
        }
    }
}

#Preview {
    TabBarView()
}
