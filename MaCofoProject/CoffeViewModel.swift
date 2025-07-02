//
//  CoffeViewModel.swift
//  MaCofoProject
//
//  Created by Foundation-010 on 01/07/25.
//

import Foundation

class CoffeeViewModel: ObservableObject {
    @Published var coffees: [CoffeeProduct] = []

    func fetchCoffees() {
        guard let url = URL(string: "http://localhost:3000/api/coffees") else { return }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print("Network error:", error)
                return
            }
            guard let data = data else {
                print("No data received")
                return
            }
            do {
                let decoded = try JSONDecoder().decode([CoffeeProduct].self, from: data)
                DispatchQueue.main.async {
                    print("Loaded \(decoded.count) coffees")
                    self.coffees = decoded
                }
            } catch {
                print("Decode error:", error)
            }
        }.resume()
    }


}
