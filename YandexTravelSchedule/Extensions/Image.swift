//
//  Image.swift
//  YandexTravelSchedule
//
//  Created by Никита Козловский on 26.11.2024.
//

import SwiftUI

extension Image {
    static let iconTabSearch = Image("schedule").renderingMode(.template)
    static let iconTabSettings = Image("settings").renderingMode(.template)

    static let iconSearchSwap = Image(systemName: "arrow.2.squarepath")
    static let iconSearching = Image(systemName: "magnifyingglass")
    static let iconSearchCancel = Image(systemName: "xmark.circle.fill")

    static let iconBackward = Image(systemName: "chevron.backward")
    static let iconForward = Image(systemName: "chevron.forward")

    static let iconArrow = Image(systemName: "arrow.forward")

    static let iconCheckboxOn = Image(systemName: "checkmark.square.fill")
    static let iconCheckboxOff = Image(systemName: "square")
    static let iconRadioOn = Image(systemName: "largecircle.fill.circle")
    static let iconRadioOff = Image(systemName: "circle")

    static let imageServerError = Image("xmark.circle.fill")
}
