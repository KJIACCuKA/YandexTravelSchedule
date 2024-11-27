//
//  CityView.swift
//  YandexTravelSchedule
//
//  Created by Никита Козловский on 27.11.2024.
//

import SwiftUI

struct CityView: View {
    
    @Binding var schedule: Schedules
    @Binding var navPath: [ViewsRouter]
    @Binding var direction: Int

    @State private var searchString = String()

    private var searchingResults: [City] {
        searchString.isEmpty
            ? schedule.cities
            : schedule.cities.filter { $0.title.lowercased().contains(searchString.lowercased()) }
    }
    
    var body: some View {
        VStack(spacing: 0) {
            SearchBarView(searchText: $searchString)
            if searchingResults.isEmpty {
                SearchNothingView(notification: "Город не найден")
            } else {
                ScrollView(.vertical) {
                    ForEach(searchingResults) { city in
                        if #available(iOS 16.0, *) {
                            NavigationLink(value: ViewsRouter.stationView) {
                                RowSearchView(rowString: city.title)
                            }
                            .simultaneousGesture(TapGesture().onEnded {
                                schedule.destinations[direction].cityTitle = city.title
                            })
                            .setRowElement()
                            .padding(.vertical, .spacerL)
                        } else {
                            // Fallback on earlier versions
                        }
                    }
                }
                .padding(.vertical, .spacerL)
            }
            Spacer()
        }
        .setCustomNavigationBar(title: "Выбор города")
        .foregroundStyle(.ypBlackDuo)
        .onAppear {
            searchString = String()
        }
    }
}

#Preview {
    NavigationStack {
        CityView(schedule: .constant(Schedules.sampleData), navPath: .constant([]), direction: .constant(0))
    }
}
