//
//  CoffeProduct.swift
//  MaCofoProject
//
//  Created by Foundation-010 on 01/07/25.
//

import Foundation

struct CoffeeProduct: Codable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let image: String
    let category: String
}
