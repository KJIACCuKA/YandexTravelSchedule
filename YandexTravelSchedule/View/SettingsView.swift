//
//  SettingsView.swift
//  YandexTravelSchedule
//
//  Created by Никита Козловский on 22.11.2024.
//

import SwiftUI

struct SettingsView: View {
    
    @State private var isEnabled = false
    
    var body: some View {
        VStack {
            Toggle("Темная тема", isOn: $isEnabled)
                .padding(.all, 16)
            Button(action: userLicense) {
                HStack {
                    Text("Пользовательское соглашение")
                        .foregroundColor(.black)
                    Spacer()
                    Image("Bolt", bundle: nil)
                }
                .padding(.leading, 16)
                .padding(.trailing, 16)
            }
            Spacer()
            VStack {
                Text("Приложение использует API «Яндекс.Расписания»")
                    .padding(.all, 16)
                Text("Версия 1.0 (beta)")
            }
            .font(.system(size: 12))
        }
    }
    
    func userLicense() {
        print("Work")
    }
}

#Preview {
    SettingsView()
}
