//
//  WebView.swift
//  H4X0R News
//
//  Created by Alexandra on 26.10.25.
//

import SwiftUI
import WebKit

#if os(macOS)
public typealias ViewRepresentable = NSViewRepresentable
#else
public typealias ViewRepresentable = UIViewRepresentable
#endif

struct WebView: ViewRepresentable {
    let urlString: String?
    
    //how to define only func name??
#if os(macOS)
    func makeNSView(context: Context) -> WKWebView {
        return WKWebView()
    }
#else
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
#endif
    
    
#if os(macOS)
    func updateNSView(_ uiView: WKWebView, context: Context) {
        updateView(uiView, context: context)
    }
#else
    func updateUIView(_ uiView: WKWebView, context: Context) {
        updateView(uiView, context: context)
    }
#endif
    
    func updateView(_ uiView: WKWebView, context: Context) {
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
