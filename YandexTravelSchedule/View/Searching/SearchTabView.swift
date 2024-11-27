//
//  SearchTabView.swift
//  YandexTravelSchedule
//
//  Created by Никита Козловский on 27.11.2024.
//

import SwiftUI

struct SearchTabView: View {
    
    @Binding var stories: [Story]
    @Binding var schedule: Schedules
    @Binding var navPath: [ViewsRouter]
    @Binding var direction: Int
    
    var body: some View {
        VStack(spacing: 0.0) {
            StoriesListView(stories: $stories)
            MainSearchView(schedule: $schedule, navPath: $navPath, direction: $direction)
            Spacer()
        }
    }
}

#Preview {
    NavigationStack {
        SearchTabView(
            stories: .constant(Story.sampleData),
            schedule: .constant(Schedules.sampleData),
            navPath: .constant([]),
            direction: .constant(0)
        )
    }
}
