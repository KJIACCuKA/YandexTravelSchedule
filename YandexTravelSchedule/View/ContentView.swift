//
//  ContentView.swift
//  YandexTravelSchedule
//
//  Created by Никита Козловский on 09.11.2024.
//

import SwiftUI
import OpenAPIURLSession

struct ContentView: View {
    
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
    
    var body: some View {
        VStack {
            Button("getNearestStations") {
                getNearestStations()
            }
            .padding()
            Button("getCopyright") {
                getCopyright()
            }
            .padding()
            Button("getSchedules") {
                getSchedules()
            }
            .padding()
            Button("getSearches") {
                getSearches()
            }
            .padding()
            Button("getThreads") {
                getThreads()
            }
            .padding()
            Button("getNearestSettlement") {
                getNearestSettlement()
            }
            .padding()
            Button("getCarriers") {
                getCarriers()
            }
            .padding()
            Button("getStationsList") {
                getStationsList()
            }
            .padding()
        }
    }
}

private extension ContentView {
    func getNearestStations() {
        let service = NearestStationsService(client: client, apikey: Resources.apiKey)
        Task {
            do {
                let response = try await service.getNearestStations(lat: 59.864177, lng: 30.319163, distance: 50)
                guard
                    let stations = response.stations,
                    let total = response.pagination?.total,
                    let limit = response.pagination?.limit else { return }
                print(
                    stations,
                    "\n pagination.total:",
                    total,
                    "\n pagination.limit:",
                    limit,
                    "\n stations.count:",
                    stations.count
                )
            } catch {
                print(error.localizedDescription)
            }
        }
    }

    func getCopyright() {
        let service = CopyrightService(client: client, apikey: Resources.apiKey)
        Task {
            do {
                let response = try await service.getCopyright()
                print(response)
            } catch {
                print(error.localizedDescription)
            }
        }
    }

    func getSchedules() {
        let service = SchedulesService(client: client, apikey: Resources.apiKey)
        Task {
            do {
                let response = try await service.getSchedule(station: "s9600213", date: "2024-11-11")
                guard
                    let schedules = response.schedule,
                    let total = response.pagination?.total,
                    let limit = response.pagination?.limit else { return }
                print(
                    response,
                    "\n pagination.total:",
                    total,
                    "\n pagination.limit:",
                    limit,
                    "\n schedules.count:",
                    schedules.count
                )
            } catch {
                print(error.localizedDescription)
            }
        }
    }

    func getSearches() {
        let service = SearchService(client: client, apikey: Resources.apiKey)
        Task {
            do {
                let response = try await service.getSearch(from: "s9623561", to: "s9600213")
                guard
                    let segments = response.segments,
                    let intervalSegments = response.interval_segments,
                    let total = response.pagination?.total,
                    let limit = response.pagination?.limit else { return }
                print(
                    response,
                    "\n pagination.total:",
                    total,
                    "\n pagination.limit:",
                    limit,
                    "\n segments.count:",
                    segments.count,
                    "\n intervalSegments.count:",
                    intervalSegments.count
                )
            } catch {
                print(error.localizedDescription)
            }
        }
    }

    func getThreads() {
        
        let service = ThreadService(
            client: client,
            apikey: Resources.apiKey
        )
        
        Task {
            let threads = try await service.getThread(
                uid: "6802_0_2006004_g24_4"
            )
            print(threads)
        }
    }

    func getNearestSettlement() {
        let service = NearestSettlementService(client: client, apikey: Resources.apiKey)
        Task {
            do {
                let response = try await service.getNearestSettlement(lat: 59.864177, lng: 30.319163)
                print(response)
            } catch {
                print(error.localizedDescription)
            }
        }
    }

    func getCarriers() {
        let service = CarriersService(client: client, apikey: Resources.apiKey)
        Task {
            do {
                let response = try await service.getCarrier(code: "SU", system: .iata)
                print(response)
            } catch {
                print(error.localizedDescription)
            }
        }
    }

    func getStationsList() {
        let service = StationsListService(client: client, apikey: Resources.apiKey)
        Task {
            do {
                let stations = try await service.getStationsList()
                guard let countries = stations.countries else { return }
                print("Total countries at the list:", countries.count)

                var totalStations = 0
                countries.forEach {
                    $0.regions?.forEach {
                        $0.settlements?.forEach {
                            $0.stations?.forEach { _ in totalStations += 1 }
                        }
                    }
                }
                print("Total stations: \(totalStations)")
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

#Preview {
    ContentView()
}
