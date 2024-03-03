//
//  LogoView.swift
//  PosteApp
//
//  Created by David Zemlin on 2/6/24.
//

import Foundation
import SwiftUI

// A view that breifly displays the Poste logo and then calls the next screen
struct SplashView: View {
    
    // @State var changeView:AppController.ActiveView = AppController.ActiveView.splash
    @State var startViewChange = false
    @State var size = 0.7
    @State var opac  = 0.0
    
    var body: some View {
        // switch statment for page changing
        if startViewChange {
            switch AppController.GetAppController().GetActiveView() {
            case .splash:
                SplashView()
            case .login:
                LoginView()
            case .register:
                RegisterView()
            case .folder:
                FolderView()
            }
        }
        // Build the layout of the screen and animation
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
                        print("done")
                        AppController.GetAppController().SetActiveView(AppController.ActiveView.folder)
                        self.startViewChange = true;
                    }
                }
            }
        }
    }
}

#Preview {
    SplashView()
}
