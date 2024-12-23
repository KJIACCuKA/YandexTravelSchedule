//
//  NetworkService.swift
//  YandexTravelSchedule
//
//  Created by Никита Козловский on 23.12.2024.
//

import Foundation
import OpenAPIURLSession


actor NetworkService: Sendable {
    let serverURL: URL
    let client: Client

    init() {
        do {
            serverURL = try Servers.server1()
        } catch {
            preconditionFailure("Cannot obtain server URL")
        }
        client = Client(
            serverURL: serverURL,
            transport: URLSessionTransport(),
            middlewares: [AuthenticationMiddleware(authorizationHeaderFieldValue: Resources.apiKey)]
        )
    }
}
