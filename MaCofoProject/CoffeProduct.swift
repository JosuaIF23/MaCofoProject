//
//  CoffeProduct.swift
//  MaCofoProject
//
//  Created by Foundation-010 on 30/06/25.
//

import Foundation

struct CoffeProduct: Codable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let image: String
    let category: String
}


