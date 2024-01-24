//
//  ContentView.swift
//  App 2
//
//  Created by David Zemlin on 1/23/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(.systemMint).ignoresSafeArea()
            VStack(alignment: .leading, spacing: 20.0) {
                Image("WWF")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(15)
                
                HStack {
                    
                    Text("WWF Panda Meme")
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer()
                    VStack {
                        HStack{
                            
                            Image(systemName: "star.fill")
                            Image(systemName: "star.fill")
                            Image(systemName: "star.fill")
                            Image(systemName: "star.fill")
                            Image(systemName: "star.leadinghalf.filled")
                            
                        }
                        
                        Text("(Reviews 361)")
                    }
                    .foregroundColor(.orange)
                    .font(.caption)
                }

                Text("Funny meme playing on the name dispute between the World Wrestling Federation and the World Wildlife Foundation")
                
                HStack{
                    Spacer()
                    Image(systemName: "fork.knife")
                    Image(systemName: "binoculars.fill")
                }
                .foregroundColor(.gray)
                .font(.caption)

            }
            .padding()
            .background(Rectangle().foregroundColor(.white)).cornerRadius(15).shadow(radius: 15)
            .padding()
        }

        }
}

#Preview {
    ContentView()
}
