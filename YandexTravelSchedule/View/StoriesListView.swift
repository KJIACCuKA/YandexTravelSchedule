//
//  StoriesListView.swift
//  YandexTravelSchedule
//
//  Created by Никита Козловский on 27.11.2024.
//

import SwiftUI

struct StoriesListView: View {
    
    @Binding var stories: [Story]

    private let rows = [GridItem(.flexible())]
    private let stat = true
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: rows, alignment: .center, spacing: 12) {
                ForEach($stories, id: \.self) { $story in
                    ZStack {
                        Image("\(story.previewImageName)")
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                            .opacity(story.isRead ? 0.5 : 1)
                        RoundedRectangle(cornerRadius: 16)
                            .strokeBorder(.ypBlue, lineWidth: story.isRead ? 0 : 4)
                    }
                    .frame(width: 92, height: 140)
                }
            }
            .padding(.horizontal, .spacerL)
            .padding(.vertical, .spacerXXL)
        }
        .frame(height: 188)
    }
}

#Preview {
    StoriesListView(stories: .constant(Story.sampleData))
}
