//
//  Filter.swift
//  YandexTravelSchedule
//
//  Created by Никита Козловский on 25.11.2024.
//

import Foundation

struct Filter: Hashable {
    var isWithTransfers = true
    var isAtNight = true
    var isMorning = true
    var isAfternoon = true
    var isEvening = true
}

extension Filter {
    static let fullSearch = Filter()
    static let customSearch = Filter(isWithTransfers: false, isMorning: false)
}
