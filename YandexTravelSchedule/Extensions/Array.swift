//
//  Array.swift
//  YandexTravelSchedule
//
//  Created by Никита Козловский on 24.12.2024.
//

import Foundation

extension Array where Element: Hashable {
    func difference(from other: [Element]) -> [Element] {
        let mainArrayAsSet = Set(self)
        let otherArrayAsSet = Set(other)
        return Array(mainArrayAsSet.symmetricDifference(otherArrayAsSet))
    }
}
