//
//  URLSession.swift
//  YandexTravelSchedule
//
//  Created by Никита Козловский on 24.12.2024.
//

import Foundation

extension URLSession {
    func data(from url: URL) async throws -> (Data, URLResponse) {
        try await URLSession.shared.data(from: url, delegate: nil)
    }
}
