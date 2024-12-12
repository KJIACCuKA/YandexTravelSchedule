//
//  SearchNothingView.swift
//  YandexTravelSchedule
//
//  Created by Никита Козловский on 27.11.2024.
//

import SwiftUI

struct SearchNothingView: View {
    
    @State var notification: String
    
    var body: some View {
        Spacer()
        Text(notification)
            .font(.boldMedium)
        Spacer()
    }
}

#Preview {
    SearchNothingView(notification: "Nothing is here")
}
