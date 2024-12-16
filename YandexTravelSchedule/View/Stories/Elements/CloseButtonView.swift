//
//  CloseButtonView.swift
//  YandexTravelSchedule
//
//  Created by Никита Козловский on 12.12.2024.
//

import SwiftUI

struct CloseButtonView: View {
    
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                Circle()
                    .foregroundStyle(AppColors.Universal.white)
                AppImages.Icons.cancel
                    .resizable()
                    .foregroundStyle(AppColors.Universal.black)
            }
            .frame(width: AppSizes.Size.button, height: AppSizes.Size.button)
        }
    }
}

#Preview {
    CloseButtonView { }
        .padding()
        .background(AppColors.Universal.blue)
}
