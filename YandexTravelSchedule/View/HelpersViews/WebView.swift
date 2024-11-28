//
//  WebView.swift
//  YandexTravelSchedule
//
//  Created by Никита Козловский on 28.11.2024.
//

import SwiftUI
import WebKit

enum URLAdress {
    static let agreementURL = URL(string: "https://yandex.ru/travel/schedule/agreement")
}

struct WebView: UIViewRepresentable {
    
    let url: URL
    @ObservedObject var viewModel: ProgressViewModel
    
    private let webView = WKWebView()
    
    func makeUIView(context: Context) -> WKWebView {
        webView.load(URLRequest(url: url))
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
    }
}

extension WebView {
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self, viewModel: viewModel)
    }
    
    class Coordinator: NSObject {
        private var parent: WebView
        private var viewModel: ProgressViewModel
        private var observer: NSKeyValueObservation?
        
        init(_ parent: WebView, viewModel: ProgressViewModel) {
            self.parent = parent
            self.viewModel = viewModel
            super.init()
            
            observer = self.parent.webView.observe(\.estimatedProgress) { [weak self] webView, _ in
                guard let self = self else { return }
                self.parent.viewModel.progress = webView.estimatedProgress
            }
        }
        
        deinit {
            observer = nil
        }
    }
}

extension WebView {
    class ProgressViewModel: ObservableObject {
        @Published var progress: Double = .zero
        
        init (progress: Double) {
            self.progress = progress
        }
    }
}

#Preview {
    WebView(url: URLAdress.agreementURL!, viewModel: WebView.ProgressViewModel(progress: .zero))
}
