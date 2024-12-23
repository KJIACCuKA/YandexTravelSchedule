//
//  Destination.swift
//  YandexTravelSchedule
//
//  Created by Никита Козловский on 25.11.2024.
//

import Foundation

// MARK: - Struct
struct Destination: Hashable, Identifiable, Sendable {
    let id = UUID()
    var city: City
    var station: Station
}

// MARK: - Mock data
extension Destination {
    static var emptyDestination = [
        Destination(
            city: City(title: "", yandexCode: "", stationsCount: 0),
            station: Station(title: "", type: "", code: "", latitude: 0, longitude: 0)
        ),
        Destination(
            city: City(title: "", yandexCode: "", stationsCount: 0),
            station: Station(title: "", type: "", code: "", latitude: 0, longitude: 0)
        )
    ]

    static let sampleData: [Destination] = [
        Destination(
            city: City(title: "Москва", yandexCode: "", stationsCount: 0),
            station: Station(title: "Ярославский Вокзал", type: "", code: "", latitude: 0, longitude: 0)
        ),
        Destination(
            city: City(title: "Санкт-Петербург", yandexCode: "", stationsCount: 0),
            station: Station(title: "Балтийский вокзал", type: "", code: "", latitude: 0, longitude: 0)
        )
    ]
}
