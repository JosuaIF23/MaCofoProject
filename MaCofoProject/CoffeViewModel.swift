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
        guard let url = URL(string: "https://coffee-api.fernandohg97.vercel.app/api/v1/products") else { return }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data {
                do {
                    let decoded = try JSONDecoder().decode([CoffeeProduct].self, from: data)
                    DispatchQueue.main.async {
                        self.coffees = decoded
                    }
                } catch {
                    print("Decode error:", error)
                }
            }
        }.resume()
    }
}
