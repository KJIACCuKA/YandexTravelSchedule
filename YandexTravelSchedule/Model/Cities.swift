//
//  Cities.swift
//  YandexTravelSchedule
//
//  Created by Никита Козловский on 25.11.2024.
//

import Foundation

// MARK: - Struct
struct City: Hashable, Identifiable {
    let id = UUID()
    let title: String
}

// MARK: - Mock data
extension City {
    static let sampleData = [
        City(title: "Москва"),
        City(title: "Санкт-Петербург"),
        City(title: "Сочи"),
        City(title: "Горный Воздух"),
        City(title: "Краснодар"),
        City(title: "Казань"),
        City(title: "Омск")
    ]
}
