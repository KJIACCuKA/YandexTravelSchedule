//
//  SplashScreenView.swift
//  YandexTravelSchedule
//
//  Created by Никита Козловский on 28.11.2024.
//

import SwiftUI

struct SplashScreenView: View {
    
    @State private var isPresented: Bool = false
    @State private var schedule = Schedules.sampleData
    @State private var darkMode = false
    
    var body: some View {
        if isPresented {
            RootTabView(schedule: $schedule, darkMode: $darkMode)
            .environment(\.colorScheme, darkMode ? .dark : .light)
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

#Preview {
    SplashScreenView()
}
