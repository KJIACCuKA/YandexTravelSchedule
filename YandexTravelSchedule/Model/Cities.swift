//
//  Cities.swift
//  YandexTravelSchedule
//
//  Created by Никита Козловский on 25.11.2024.
//

import Foundation

// MARK: - Struct
struct City: Hashable, Identifiable, Sendable {
    let id = UUID()
    let title: String
    let yandexCode: String
    let stationsCount: Int

    enum Codes: String, CaseIterable, Hashable {
        case express, yandex, esr, esrCode, yandexCode
    }
}

// MARK: - Mock data
extension City {
    static let sampleData = [
        City(title: "Москва", yandexCode: "", stationsCount: 0),
        City(title: "Санкт-Петербург", yandexCode: "", stationsCount: 0),
        City(title: "Сочи", yandexCode: "", stationsCount: 0),
        City(title: "Горный Воздух", yandexCode: "", stationsCount: 0),
        City(title: "Краснодар", yandexCode: "", stationsCount: 0),
        City(title: "Казань", yandexCode: "", stationsCount: 0),
        City(title: "Омск", yandexCode: "", stationsCount: 0)
    ]
}
