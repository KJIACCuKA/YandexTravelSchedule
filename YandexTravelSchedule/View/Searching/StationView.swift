//
//  StationView.swift
//  YandexTravelSchedule
//
//  Created by Никита Козловский on 27.11.2024.
//

import SwiftUI

struct StationView: View {
    
    @Binding var schedule: Schedules
    @Binding var navPath: [ViewsRouter]
    @Binding var direction: Int

    @State private var searchString = String()

    private var searchingResults: [Station] {
        searchString.isEmpty
            ? schedule.stations
            : schedule.stations.filter { $0.title.lowercased().contains(searchString.lowercased()) }
    }
    
    var body: some View {
        VStack(spacing: 0) {
            SearchBarView(searchText: $searchString)
            if searchingResults.isEmpty {
                SearchNothingView(notification: "Станция не найдена")
            } else {
                ScrollView(.vertical) {
                    ForEach(searchingResults) { station in
                        Button {
                            schedule.destinations[direction].stationTitle = station.title
                            navPath.removeAll()
                        } label: {
                            RowSearchView(rowString: station.title)
                        }
                        .setRowElement()
                        .padding(.vertical, .spacerL)
                    }
                }
                .padding(.vertical, .spacerL)
            }
            Spacer()
        }
        .setCustomNavigationBar(title: "Выбор станции")
        .foregroundStyle(.ypBlackDuo)
        .onAppear {
            searchString = String()
        }
    }
}

#Preview {
    NavigationStack {
        StationView(
            schedule: .constant(Schedules.sampleData),
            navPath: .constant([]),
            direction: .constant(.departure)
        )
    }
}
