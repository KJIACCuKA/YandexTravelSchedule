//
//  SettingsViewModel.swift
//  YandexTravelSchedule
//
//  Created by Никита Козловский on 24.12.2024.
//

import SwiftUI

@MainActor
final class SettingsViewModel: ObservableObject {
    @AppStorage("DarkMode") var darkMode: Bool = false {
        willSet {
            objectWillChange.send()
        }
    }
    @Published var copyrightInfo = String()

    enum Titles {
        static let darkMode = "Тёмная тема"
        static let agreement = "Пользовательское соглашение"
        static let version = "Версия \(Bundle.main.appVersionLong).\(Bundle.main.appBuild)"
    }

    private let networkService: NetworkService

    init(networkService: NetworkService) {
        self.networkService = networkService
    }
}
