//
//  CheckboxToggleStyle.swift
//  YandexTravelSchedule
//
//  Created by Никита Козловский on 26.11.2024.
//

import SwiftUI

struct CheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        HStack(spacing: 0) {
            configuration.label
            Spacer()
            (configuration.isOn ? Image.iconCheckboxOn : Image.iconCheckboxOff)
                .resizable()
                .frame(width: 24, height: 24)
                .onTapGesture { configuration.isOn.toggle() }
        }
    }
}
