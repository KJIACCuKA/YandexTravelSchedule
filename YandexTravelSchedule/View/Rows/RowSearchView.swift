//
//  CityRowView.swift
//  YandexTravelSchedule
//
//  Created by Никита Козловский on 25.11.2024.
//

import SwiftUI

struct RowSearchView: View {
    
    @State var rowString: String
    
    var body: some View {
        HStack(spacing: 0) {
            Text(rowString)
                .font(.regMedium)
            Spacer()
            Image(systemName: "chevron.forward")
                .imageScale(.large)
        }
    }
}

#Preview {
    RowSearchView(rowString: "Moscow")
}
