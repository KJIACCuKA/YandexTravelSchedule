//
//  YandexTravelScheduleApp.swift
//  YandexTravelSchedule
//
//  Created by Никита Козловский on 09.11.2024.
//

import SwiftUI

@main
struct YandexTravelScheduleApp: App {
    
    @State private var schedule = Schedules.sampleData
    @State private var darkMode = false
    
    var body: some Scene {
        WindowGroup {
            SplashScreenView()
        }
    }
}
