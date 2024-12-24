//
//  SetCustomButton.swift
//  YandexTravelSchedule
//
//  Created by Никита Козловский on 23.12.2024.
//

import SwiftUI

struct SetCustomButton: ViewModifier {
    
    @State var width: CGFloat?
    @State var padding: Edge.Set
    
    func body(content: Content) -> some View {
        content
            .font(AppFonts.Bold.small)
            .foregroundStyle(AppColors.Universal.white)
            .frame(maxHeight: AppSizes.Height.searchButton)
            .frame(maxWidth: (width != nil) ? width : .infinity)
            .background(AppColors.Universal.blue)
            .clipShape(RoundedRectangle(cornerRadius: AppSizes.CornerRadius.large))
            .padding(padding, AppSizes.Spacing.large)
    }
}