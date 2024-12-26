//
//  SetRowElement.swift
//  YandexTravelSchedule
//
//  Created by Никита Козловский on 26.11.2024.
//

import SwiftUI

struct SetRowElement: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(AppFonts.Regular.medium)
            .padding(.horizontal, AppSizes.Spacing.large)
            .frame(maxWidth: .infinity, maxHeight: AppSizes.Height.row)
    }
}
