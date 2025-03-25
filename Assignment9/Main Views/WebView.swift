//
//  WebView.swift
//  Assignment9
//
//  Created by Nathaniel Mauldin on 2025-03-24.
//

import WebKit
import SwiftUI

struct WebView: UIViewRepresentable{
    let webText: String?
    
    func makeUIView(context: Context) -> WKWebView {
        WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let text = webText, let url = URL(string: text) else { return }
        
        let request = URLRequest(url: url)
        uiView.load(request)
    }
    
    typealias UIViewType = WKWebView

    
}
