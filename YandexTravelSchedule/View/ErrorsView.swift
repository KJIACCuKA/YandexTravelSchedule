//
//  ErrorsView.swift
//  YandexTravelSchedule
//
//  Created by Никита Козловский on 27.11.2024.
//

import SwiftUI

struct ErrorsView: View {
    
    @State var errorType: Errors
    
    var body: some View {
        Image(errorType.imageName)
        Text(errorType.description)
            .font(.boldMedium)
    }
}

#Preview {
    ErrorsView(errorType: Errors.serverError)
}
