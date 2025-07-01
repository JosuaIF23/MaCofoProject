//
//  Card.swift
//  MaCofoProject
//
//  Created by Foundation-010 on 30/06/25.
//

import SwiftUI

struct Card: View {
    var drinkName: String
    var imageName: String
    
    var body: some View {
        VStack{
            Image(imageName)
            .resizable()
            .scaledToFit()
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
    Card(drinkName: "Americano", imageName: "Logo")
}
