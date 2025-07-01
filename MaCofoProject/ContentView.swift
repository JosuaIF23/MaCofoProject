//
//  ContentView.swift
//  MaCofoProject
//
//  Created by Foundation-010 on 30/06/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color.skinBackground.ignoresSafeArea()
            VStack {
             
              
          
                Image("Logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 400, height: 400)
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
