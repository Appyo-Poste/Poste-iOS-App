//
//  ContentView.swift
//  Tutorial1
//
//  Created by David Zemlin on 1/18/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        // normal comment format
        
        /*
         yep, still the same.
         */
        
        VStack {
            Button("Imma Button") {
                print("Yup! he's a button.")
            }
            Image("WWF")
                .imageScale(.large)
                .foregroundStyle(.purple)
                .cornerRadius(30)
            Text("Poste").bold().padding(.vertical).font(.system(size: 32))
            Text("Comming to iOS!!!").bold().font(.system(size: 20))
        }
        .padding()
    }
}

// MARK: - This is the preview code

#Preview {
    ContentView()
}
