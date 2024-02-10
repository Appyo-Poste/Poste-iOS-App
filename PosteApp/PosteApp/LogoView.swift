//
//  LogoView.swift
//  PosteApp
//
//  Created by David Zemlin on 2/6/24.
//

import Foundation

import SwiftUI

struct LogoView: View {
    
    @State var isActive = false
    @State var size = 0.7
    @State var opac  = 0.0
    
    var body: some View {
        if isActive == true {
            LoginView()
        }
        else {
            VStack {
                ZStack {
                    Image("PosteLogo")
                }.scaleEffect(size).opacity(opac).onAppear() {
                    withAnimation(Animation.easeIn(duration: 1.4)) {
                        self.size = 0.9
                        self.opac = 1.0
                    }
                }
            }.onAppear() {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation() {
                        self.isActive = true;
                    }
                }
            }
        }
    }
}

#Preview {
    LogoView()
}
