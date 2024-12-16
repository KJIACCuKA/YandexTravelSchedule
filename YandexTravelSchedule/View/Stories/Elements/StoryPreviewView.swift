//
//  StoryPreviewView.swift
//  YandexTravelSchedule
//
//  Created by Никита Козловский on 12.12.2024.
//

import SwiftUI

struct StoryPreviewView: View {
    
    private let titleLineLimit = 3
    var storyPreview: Story
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image(storyPreview.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: AppSizes.Width.storyPreview, height: AppSizes.Height.storyPreview)
                .clipShape(RoundedRectangle(cornerRadius: AppSizes.CornerRadius.large))
                .opacity(storyPreview.isShowed ? .halfOpacity : .fullOpacity)

            Text(storyPreview.title)
                .foregroundColor(AppColors.Universal.white)
                .font(AppFonts.Regular.small)
                .padding(.horizontal, AppSizes.Spacing.small)
                .padding(.bottom, AppSizes.Spacing.medium)
                .lineLimit(titleLineLimit)

            RoundedRectangle(cornerRadius: AppSizes.CornerRadius.large)
                .strokeBorder(
                    AppColors.Universal.blue,
                    lineWidth: storyPreview.isShowed ? .zero : AppSizes.Line.large
                )
        }
        .padding(.zero)
        .frame(width: AppSizes.Width.storyPreview, height: AppSizes.Height.storyPreview)
        .contentShape(RoundedRectangle(cornerRadius: AppSizes.CornerRadius.large))
    }
}

#Preview {
    let newStory = Story.mockData[0]
    var showedStory = Story.mockData[0]
    showedStory.isShowed = true
    return HStack {
        StoryPreviewView(storyPreview: newStory)
        StoryPreviewView(storyPreview: showedStory)
    }
}
