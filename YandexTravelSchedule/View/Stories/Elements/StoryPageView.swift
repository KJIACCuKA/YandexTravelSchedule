//
//  StoryPageView.swift
//  YandexTravelSchedule
//
//  Created by Никита Козловский on 12.12.2024.
//

import SwiftUI

struct StoryPageView: View {
    
    private enum LineLimits {
        static let title = 2
        static let description = 3
    }
    
    var model: StoryPage
    
    var body: some View {
        AppColors.Universal.black
            .ignoresSafeArea()
            .overlay {
                ZStack {
                    Image(model.imageName)
                        .resizable()
                        .scaledToFill()
                        .clipShape(RoundedRectangle(cornerRadius: AppSizes.CornerRadius.Custom.story))
                        .padding(.top, AppSizes.Spacing.xSmall)
                        .padding(.horizontal, .zero)

                    VStack(alignment: .leading, spacing: AppSizes.Spacing.medium) {
                        Spacer()

                        Text(model.title)
                            .font(AppFonts.Bold.large)
                            .lineLimit(LineLimits.title)

                        Text(model.description)
                            .font(AppFonts.Regular.large)
                            .lineLimit(LineLimits.description)
                    }
                    .foregroundStyle(AppColors.Universal.white)
                    .padding(.horizontal, AppSizes.Spacing.medium)
                    .padding(.bottom, AppSizes.Spacing.Custom.story)
                }
                .padding(.bottom, AppSizes.Spacing.large)
            }
    }
}

#Preview {
    StoryPageView(model: StoryPage.mockData1[0])
}
