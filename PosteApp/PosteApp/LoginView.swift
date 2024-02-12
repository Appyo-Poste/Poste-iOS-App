//
//  ContentView.swift
//  PosteApp
//
//  Created by David Zemlin on 2/6/24.
//

import SwiftUI

struct LoginView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var startViewChange = false
    @StateObject var appCon = AppController.GetAppController()
    
    
    var body: some View {
        if startViewChange && appCon.username != "" {
            switch AppController.GetAppController().GetActiveView() {
            case .splash:
                SplashView()
            case .login:
                LoginView()
            }
        }
        else {
            VStack {
                HStack(alignment: .bottom){
                    Image("PosteLogoLarge").resizable().aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fit/*@END_MENU_TOKEN@*/).frame(width: 220.0).padding(.trailing, 130.0)
                    
                }
                Text("Find, retrieve, and save. Simple as that.")
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                HStack {
                    Text("Login")
                        .font(.largeTitle)
                        .multilineTextAlignment(.center)
                        .bold()
                        .fontWeight(.heavy)
                        .padding([.top, .leading, .bottom])
                    Spacer()
                }
                HStack {
                    Text("Email")
                        .font(.headline)
                        .padding(.leading)
                    Spacer()
                }
                HStack {
                    TextField("Username", text: $username).padding(.leading).padding(.horizontal).frame(width: 300, height: 50).background(Color.black.opacity(0.15)).cornerRadius(10.0)
                }
                HStack {
                    Text("Password")
                        .font(.headline)
                        .padding(.leading)
                    Spacer()
                }
                HStack {
                    SecureField("Password", text: $password).padding(.horizontal)
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.15))
                        .cornerRadius(10.0)
                }
            }.padding(.all)
            Button("Login") {
                AppController.GetAppController().SetActiveView(AppController.ActiveView.splash)
                startViewChange = true;
            }
            .foregroundColor(.white)
            .frame(width: 300, height: 50)
            .background(Color("mainDark"))
            .cornerRadius(20)
            Spacer()
            HStack {
                Text("Don't have an account?")
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                Button("Sing Up") {
                    
                }
                .font(.headline)
                .multilineTextAlignment(.leading)
            }
            Spacer()
        }
    }
}

#Preview {
    LoginView()
}
