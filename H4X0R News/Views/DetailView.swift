//
//  DetailView.swift
//  H4X0R News
//
//  Created by Alexandra on 26.10.25.
//

import SwiftUI

struct DetailView: View {
    let url: String?
    var body: some View {
        WebView(urlString: url)
    }
}

#Preview {
    DetailView(url: "https://www.google.com")
}
