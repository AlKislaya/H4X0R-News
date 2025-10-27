//
//  ContentView.swift
//  H4X0R News
//
//  Created by Alexandra on 26.10.25.
//

import SwiftUI

struct K {
    struct Core {
        static let appName = "H4X0R News"
    }
}

struct ContentView: View {
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            List{
                ForEach(networkManager.posts) { post in
                    NavigationLink(destination: DetailView(url: post.url)) {
                        HStack {
                            Text(String(post.points))
                            Text(post.title)
                        }
                    }
                }
            }
            .navigationTitle(K.Core.appName)
#if os(iOS)
            .navigationBarTitleDisplayMode(.inline)
#endif
        }
        .onAppear() {
            networkManager.fetchData()
        }
    }
}

#Preview {
    ContentView()
}
