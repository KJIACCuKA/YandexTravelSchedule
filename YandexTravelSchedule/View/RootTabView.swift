//
//  TabBarView.swift
//  YandexTravelSchedule
//
//  Created by Никита Козловский on 22.11.2024.
//

import SwiftUI

struct RootTabView: View {
    
    @Binding var schedule: Schedules
    @Binding var darkMode: Bool
    @State var navPath: [ViewsRouter] = []
    @State var direction: Int = .departure
    @State var stories: [Story] = Story.mockData
    
    var body: some View {
        NavigationStack(path: $navPath) {
            TabView {
                SearchTabView(stories: $stories, schedule: $schedule, navPath: $navPath, direction: $direction)
                    .tabItem {
                        Image.iconTabSearch
                    }
                SettingsView(darkMode: $darkMode)
                    .tabItem {
                        Image.iconTabSettings
                    }
            }
            .accentColor(.ypBlackDuo)
            .toolbar(.visible, for: .tabBar)
            .navigationDestination(for: ViewsRouter.self) { pathValue in
                switch pathValue {
                case .cityView:
                    CityView(schedule: $schedule, navPath: $navPath, direction: $direction)
                        .toolbar(.hidden, for: .tabBar)
                case .stationView:
                    StationView(schedule: $schedule, navPath: $navPath, direction: $direction)
                        .toolbar(.hidden, for: .tabBar)
                case .routeView:
                    RoutesListView(schedule: $schedule)
                        .toolbar(.hidden, for: .tabBar)
                }
            }
        }
    }
}

#Preview {
    RootTabView(schedule: .constant(Schedules.sampleData), darkMode: .constant(false))
}
