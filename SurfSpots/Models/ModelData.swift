//
//  ModelData.swift
//  SurfSpots
//
//  Created by Camille FOL on 04/05/2022.
//

import Foundation
import Combine

final class ModelData: ObservableObject {
    @Published var spots: [Record] = []
    
    var categories: [String: [Record]] {
        Dictionary(
            grouping: spots, by: {$0.surfBreak/*[0].rawValue*/})
    }
    
    @Published var featured: Record?
    
    func getSpots() {
        guard let url = URL(string: "http://192.168.5.241:8000/") else { fatalError("Missing URL") }

        let urlRequest = URLRequest(url: url)

        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }

            guard let response = response as? HTTPURLResponse else { return }

            if response.statusCode == 200 {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        let decodedRecords = try JSONDecoder().decode([Record].self, from: data)
                        self.spots = decodedRecords
                        self.featured = self.spots.randomElement()
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            }
        }

        dataTask.resume()
    }
}
