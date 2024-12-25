//
//  YandexTravelScheduleApp.swift
//  YandexTravelSchedule
//
//  Created by Никита Козловский on 09.11.2024.
//

import SwiftUI

@main
struct YandexTravelScheduleApp: App {
    
    
    @State private var isPresented: Bool = false
    @StateObject var settings = SettingsViewModel(networkService: NetworkService())
    
    var body: some Scene {
        WindowGroup {
            if isPresented {
                RootTabView(
                    destinationsViewModel: SearchScreenViewModel(),
                    rootViewModel: RootViewModel(networkService: NetworkService())
                )
                .environmentObject(settings)
                .environment(\.colorScheme, settings.darkMode ? .dark : .light)
            } else {
                Image("splashScreen", bundle: nil)
                    .resizable()
                    .ignoresSafeArea()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                            withAnimation {
                                self.isPresented = true
                            }
                        }
                    }
            }
        }
    }
}
