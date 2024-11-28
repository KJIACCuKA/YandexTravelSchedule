//
//  AgremeentView.swift
//  YandexTravelSchedule
//
//  Created by Никита Козловский on 27.11.2024.
//

import SwiftUI
import Network

struct AgreementView: View {
    
    @State private var isConnected = true
    @State var isProgressViewVisible: Bool = true
    @StateObject var viewModel = WebView.ProgressViewModel(progress: .zero)
    let userAgreement = "Пользовательское соглашение"
    
    var body: some View {
        ZStack {
            Color.ypWhite
                .ignoresSafeArea()
            VStack {
                if isConnected {
                    if isProgressViewVisible {
                        ProgressView(value: viewModel.progress)
                            .progressViewStyle(.linear)
                            .tint(.ypBlack)
                            .scaleEffect(x: 1, y: 0.5)
                            .onChange(of: viewModel.progress) { value in
                                if value > 0.99 {
                                    isProgressViewVisible = false
                                }
                            }
                    }
                    WebView(url: URLAdress.agreementURL!, viewModel: viewModel)
                        .navigationTitle(userAgreement)
                        .background(.ypWhite)
                        .onAppear {
                            checkConnection()
                        }
                } else {
                    ErrorsView(errorType: .connectionError)
                        .navigationBarBackButtonHidden(true)
                }
            }
        }
        
        }
    func checkConnection() {
        let monitor = NWPathMonitor()
        let queue = DispatchQueue(label: "Monitor")
        
        monitor.pathUpdateHandler = { path in
            DispatchQueue.main.async {
                self.isConnected = (path.status == .satisfied)
            }
        }
        monitor.start(queue: queue)
    }
}

#Preview {
    AgreementView()
}
