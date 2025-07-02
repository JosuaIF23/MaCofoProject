//
//  CoffeeDetailView.swift
//  MaCofoProject
//
//  Created by Foundation-010 on 01/07/25.
//

import SwiftUI

struct CoffeeDetailView: View {
    let coffee: CoffeeProduct
    
    var body: some View {
        ScrollView{
            
            VStack(alignment: .leading, spacing: 20) {
                
            
                AsyncImage(url: URL(string: coffee.image)) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: .infinity)
                            .frame(height: 300)
                            .clipped()
                    } else if phase.error != nil {
                        Color.red
                            .frame(height: 250)
                            .overlay(Text("Failed to load image").foregroundColor(.white))
                    } else {
                        ProgressView()
                        
                            .frame(height:250)
                            .frame(maxWidth: .infinity)
                    }
                    
                }
                
                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        Text("\(coffee.title)")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.brownCoffe)
                        
                        Image("CardLogo")
                            .resizable()
                            
                            .frame(width: 100, height: 100)
                    }
                    
                    Divider()
                    
                    Text("ingredients)")
                        .font(.headline)
                        .foregroundColor(.brownCoffe)
                    
                    VStack(alignment: .leading, spacing: 6) {
                        ForEach(coffee.ingredients, id: \.self) {
                            ingredient in Label(ingredient, systemImage: "leaf")
                                .foregroundColor(.secondary)
                        }
                    }
                    Divider()
                    
                    
                    Text("Description")
                        .font(.headline)
                        .foregroundColor(.brownCoffe)
                    
                    Text(coffee.description)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.primary)
                }
                .padding()
                
            }
            .padding(.bottom, 40)
        }
        .background(Color.skin.ignoresSafeArea())
        .navigationTitle(coffee.title)
        .navigationBarTitleDisplayMode(.inline)
        .background(Color(.systemGroupedBackground))
    }
}

#Preview {
    let sampleCoffee = CoffeeProduct(
        title: "Cappuccino",
        description: "A foamy blend of espresso and steamed milk.",
        ingredients: ["Espresso", "Steamed Milk", "Milk Foam"],
        image: "https://upload.wikimedia.org/wikipedia/commons/c/c8/Cappuccino_at_Sightglass_Coffee.jpg"
    )

    NavigationStack {
        CoffeeDetailView(coffee: sampleCoffee)
    }
}

