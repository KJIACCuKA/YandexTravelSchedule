//
//  SetCustomNavigationBar.swift
//  YandexTravelSchedule
//
//  Created by Никита Козловский on 26.11.2024.
//

import SwiftUI

struct SetCustomNavigationBar: ViewModifier {
    @State var title: String

    func body(content: Content) -> some View {
        content
            .navigationTitle(title)
            .navigationBarTitleDisplayMode(.inline)
            .setCustomNavBackButton()
    }
}
