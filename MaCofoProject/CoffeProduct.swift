//
//  CoffeProduct.swift
//  MaCofoProject
//
//  Created by Foundation-010 on 01/07/25.
//

import Foundation

struct CoffeeProduct: Codable, Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let ingredients: [String]
    let image: String
}
