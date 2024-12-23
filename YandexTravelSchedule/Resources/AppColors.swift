//
//  AppColors.swift
//  YandexTravelSchedule
//
//  Created by Никита Козловский on 12.12.2024.
//

import SwiftUI

enum AppColors {
    /// Colors look the same in both light and dark modes.
    enum Universal {
        static let black = Color.ypBlack
        static let white = Color.ypWhite
        static let gray = Color.ypGray
        static let lightGray = Color.ypLightGray
        static let darkGray = Color.ypDarkGray
        static let blue = Color.ypBlue
        static let red = Color.ypRed
    }
    /// Colors appear differently in light and dark modes.
    enum LightDark {
        static let black = Color.ypBlackDuo
        static let white = Color.ypWhiteDuo
    }
}
