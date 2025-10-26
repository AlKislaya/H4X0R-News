//
//  NetworkManager.swift
//  H4X0R News
//
//  Created by Alexandra on 26.10.25.
//

import Foundation
import Combine

class NetworkManager: ObservableObject {
    
    @Published var posts = [Post]()
    
    let frontPageUrl = "http://hn.algolia.com/api/v1/search?tags=front_page"
    
    func fetchData() {
        if let url = URL(string: frontPageUrl) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url, completionHandler: onResponseRecieved)
            task.resume()
        }
    }
    
    func onResponseRecieved(data: Data?, response: URLResponse?, error: Error?) {
        if error != nil {
            print(error!.localizedDescription)
            return
        }
        if data == nil {
            print("err_recieved_data_nil")
            return
        }
        
        let decoder = JSONDecoder()
        do {
            let results = try decoder.decode(Results.self, from: data!)
            posts = results.hits
        } catch {
            print(error)
            return
        }
    }
}
