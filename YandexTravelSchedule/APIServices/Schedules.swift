//
//  Schedules.swift
//  YandexTravelSchedule
//
//  Created by Никита Козловский on 15.11.2024.
//

import Foundation
import OpenAPIRuntime
import OpenAPIURLSession

typealias Schedule = Components.Schemas.ScheduleStation

protocol SchedulesServiceProtocol {
    func getSchedule(station: String, date: String) async throws -> Schedule
}

final class SchedulesService: SchedulesServiceProtocol {
    private let client: Client
    private let apikey: String

    init(client: Client, apikey: String) {
        self.client = client
        self.apikey = apikey
    }

    func getSchedule(station: String, date: String) async throws -> Schedule {
        let response = try await client.getSchedule(query: .init(
            apikey: apikey,
            station: station,
            date: date
        ))
        return try response.ok.body.json
    }
}