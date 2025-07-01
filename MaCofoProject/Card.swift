//
//  Card.swift
//  MaCofoProject
//
//  Created by Foundation-010 on 01/07/25.
//

import SwiftUI

struct Card: View {
    var drinkName: String
    var imageUrl: String

    var body: some View {
        VStack {
            AsyncImage(url: URL(string: imageUrl)) { image in
                image.resizable().scaledToFit()
            } placeholder: {
                Color.gray.opacity(0.3)
            }
            .frame(height: 100)
            .cornerRadius(10)

            Text(drinkName)
                .font(.headline)
                .foregroundColor(.primary)
                .padding(.top, 5)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: .gray.opacity(0.2), radius: 4, x: 0, y: 2)
    }
}

#Preview {
    Card(drinkName: "Cappuccino", imageUrl: "https://upload.wikimedia.org/wikipedia/commons/c/c8/Cappuccino_at_Sightglass_Coffee.jpg")
}
