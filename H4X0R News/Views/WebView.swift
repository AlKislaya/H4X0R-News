//
//  WebView.swift
//  H4X0R News
//
//  Created by Alexandra on 26.10.25.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let urlString: String?
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if urlString == nil {
            print("err_urlString_nil")
            return
        }
        
        let url = URL(string: urlString!)
        if url == nil {
            print("err_url_nil")
            return
        }
        
        let request = URLRequest(url: url!)
        uiView.load(request)
    }
}
