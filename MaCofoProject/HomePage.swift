//
//  HomePage.swift
//  MaCofoProject
//
//  Created by Foundation-010 on 30/06/25.
//

import SwiftUI

struct HomePage: View {
    @StateObject private var ViewModel = CoffeViewModel()
    @State private var searchText: String = ""


    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var filteredCoffees: [CoffeProduct] {
        if searchText.isEmpty {
            return ViewModel.coffees
        } else {
            return ViewModel.coffees.filter {
                $0.name.lowercased().contains(searchText.lowercased())
            }
        }
    }
    
    
    var body: some View {
        ZStack{
            Color.skinBackground.ignoresSafeArea()
            VStack {
                HStack {
                    Image("HomepageLogo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                     
                      
                   
                    Text("What COFFEEEE You Looking For? ")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(Color.brownCoffe)
                        .fontDesign(.monospaced)
                        
                    
                    
//                    Spacer()
                    
                }
                .padding(.horizontal, 30)
                .padding(.top, 40)
                
                HStack{
                    
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)

                    
                    TextField("Search", text: $searchText)
                        .textFieldStyle(PlainTextFieldStyle())
                }
                
                .padding()
                          .background(Color.white)
                          .cornerRadius(12)
                          .shadow(color: .gray.opacity(0.2), radius: 4, x: 0, y: 2)
                          .padding(.horizontal, 30)
                          
                          Spacer()
                
                ScrollView{
                    VStack(alignment: .leading, spacing: 30) {
                        
                        Text("People Usually Drink")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.top, 30)
                        .padding(.horizontal, 30)
                        
                        
                        
                        LazyVGrid(columns: columns, spacing: 20) {
                                                  ForEach(filteredCoffees) { coffee in
                                                      Card(drinkName: coffee.name, imageName: coffee.image)
                                                  }
                                              }
                        
                        .padding(.horizontal, 30)
//                        Spacer()
                        
                    }
                    .padding(.top, 20)
                }
                Spacer()
            }
        }
        
        .onAppear{
            ViewModel.fetchCoffes()
        }
    }
}


#Preview {
    HomePage()
}
