//
//  ContentView.swift
//  MaCofoProject
//
//  Created by Foundation-010 on 30/06/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isActive : Bool = false
    @State private var fade = false
    var body: some View {
        ZStack {
            Color.skin.ignoresSafeArea()
            VStack {
                Image("Logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                
                Text("Tap anywhere to Begin")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .opacity(fade ? 1 : 0.3)
                    .animation(
                        .easeInOut(duration: 1.5)
                        .repeatForever(autoreverses: true),value: fade
                    )
            }
           
        }
        .onTapGesture {
            isActive = true
        }
        .onAppear {
            fade = true
        }
        .fullScreenCover(isPresented: $isActive) {
            HomePage()
            }
        }
    }

#Preview {
    ContentView()
}
