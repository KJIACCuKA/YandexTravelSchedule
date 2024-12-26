//
//  SearchResultEmptyView.swift
//  YandexTravelSchedule
//
//  Created by Никита Козловский on 23.12.2024.
//

import SwiftUI

struct SearchResultEmptyView: View {
    
    let notification: String
    
    var body: some View {
        Spacer()
        Text(notification)
            .font(AppFonts.Bold.medium)
        Spacer()
    }
}

#Preview {
    SearchResultEmptyView(notification: "Nothing is here")
}
