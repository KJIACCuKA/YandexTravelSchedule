//
//  YandexTravelScheduleApp.swift
//  YandexTravelSchedule
//
//  Created by Никита Козловский on 09.11.2024.
//

import SwiftUI

@main
struct YandexTravelScheduleApp: App {
    
    @StateObject var settings = SettingsViewModel(networkService: NetworkService())
    
    var body: some Scene {
        WindowGroup {
            RootTabView(
                destinationsViewModel: SearchScreenViewModel(),
                rootViewModel: RootViewModel(networkService: NetworkService())
            )
                .environmentObject(settings)
                .environment(\.colorScheme, settings.darkMode ? .dark : .light)
        }
    }
}
