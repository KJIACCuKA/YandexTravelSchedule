//
//  CityRowView.swift
//  YandexTravelSchedule
//
//  Created by Никита Козловский on 25.11.2024.
//

import SwiftUI

struct CityRowView: View {
    var body: some View {
                HStack {
                    Text("Москва")
                        .foregroundColor(.black)
                    Spacer()
                    Image("Bolt", bundle: nil)
                }
                .padding(.leading, 16)
                .padding(.trailing, 16)
    }
}

#Preview {
    CityRowView()
}
