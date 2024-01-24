//
//  ContentView.swift
//  L1Deom
//
//  Created by David Zemlin on 1/23/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ZStack {
            Color(.gray).ignoresSafeArea()
            VStack {
                Image("WWF")
                    .resizable()
                    .cornerRadius(10)
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fit/*@END_MENU_TOKEN@*/)
                    .padding(.all)
                Text("WWF")
                    .font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.white)
            }
        }

        

    }
}

#Preview {
    ContentView()
}
