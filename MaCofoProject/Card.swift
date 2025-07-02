//
//  Card.swift
//  MaCofoProject
//
//  Created by Foundation-010 on 01/07/25.
//

import SwiftUI

struct Card: View {

    
    var coffee: CoffeeProduct

    var body: some View {
        NavigationLink(destination: CoffeeDetailView(coffee: coffee)) {
            VStack{
                VStack {
                    AsyncImage(url: URL(string: coffee.image)) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(height: 120)
                            .clipped()
                    } placeholder: {
                        Color.gray.opacity(0.3)
                            .frame(height: 120)
                    }
                  
                    .cornerRadius(10)

                    Text(coffee.title)
                        .font(.headline)
                        .multilineTextAlignment(.center)
                        .padding(.top, 5)
                }
                
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.white)
                .cornerRadius(12)
                .shadow(color: .gray.opacity(0.2), radius: 4, x: 0, y: 2)
            }
            .buttonStyle(PlainButtonStyle())
        }
    }
}

#Preview {
    Card(coffee: CoffeeProduct(
        title: "Cappuccino",
        description: "A rich and foamy espresso-based drink with steamed milk.",
        ingredients: ["Espresso", "Steamed Milk", "Foamed Milk"],
        image: "https://upload.wikimedia.org/wikipedia/commons/c/c8/Cappuccino_at_Sightglass_Coffee.jpg"
    ))
    .previewLayout(.sizeThatFits)
    .padding()
}
