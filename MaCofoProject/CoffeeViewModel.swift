//
//  CoffeeViewModel.swift
//  MaCofoProject
//
//  Created by Foundation-010 on 30/06/25.
//

import Foundation

class CoffeViewModel: ObservableObject {
    @Published var coffees: [CoffeProduct] = []
    
    func fetchCoffes() {
        guard let url = URL(string: "https://coffee-api.fernandohg97.vercel.app/api/v1/products") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in if let data = data {
            do {
                    let decoded = try JSONDecoder().decode([CoffeProduct].self, from: data)
                DispatchQueue.main.async {
                    self.coffees = decoded
                    }
            } catch {
                    print("Failed to decode: \(error)")
                
                }
            }
        }
    }
}

