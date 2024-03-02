//
//  ContentView.swift
//  PosteApp
//
//  Created by David Zemlin on 2/6/24.
//

import SwiftUI

// This View runs the UI for the Login page. It takes the user input and interpets it down to the AppController to run the desired function calls. It also serves as a navigation point beteewn the register and folder pages.
struct LoginView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var startViewChange = false
    @StateObject var appCon = AppController.GetAppController()
    
    // Function to handle the "Login" Button being clicked
    func LoginPressed() {
        if appCon.login(username, password) {
            appCon.SetActiveView(AppController.ActiveView.folder)
            startViewChange = true;
        }
        else {
            print("Invalid Login and Password combo")
        }
    }
    
    // Function to handle the "Register" (sing up) Button being clicked
    func RegisterPressed() {
        appCon.SetActiveView(AppController.ActiveView.register)
        startViewChange = true
    }
    
    var body: some View {
        NavigationView {
            // switch statment for page changing
            if startViewChange && appCon.activeView != AppController.ActiveView.login {
                switch appCon.activeView {
                case .folder:
                    FolderView()
                case .register:
                    RegisterView()
                case .login:
                    LoginView()
                case .splash:
                    SplashView()
                }
            }
            // Build the view layout
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
                        TextField("Username", text: $username).padding(.leading).frame(width: 300, height: 50).background(Color.black.opacity(0.15)).cornerRadius(10.0).keyboardType(/*@START_MENU_TOKEN@*/.emailAddress/*@END_MENU_TOKEN@*/)
                            .autocapitalization(.none)
                    }
                    HStack {
                        Text("Password")
                            .font(.headline)
                            .padding([.top, .leading])
                        Spacer()
                    }
                    HStack {
                        SecureField("Password", text: $password).padding(.horizontal)
                            .frame(width: 300, height: 50)
                            .background(Color.black.opacity(0.15))
                            .cornerRadius(10.0)
                            .autocapitalization(.none)
                    }
                    .padding(/*@START_MENU_TOKEN@*/[.leading, .bottom, .trailing]/*@END_MENU_TOKEN@*/)
                    
                    Button("Login") {
                        LoginPressed()
                    }
                    .padding()
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
                            RegisterPressed()
                        }
                        .font(.headline)
                        .multilineTextAlignment(.leading)
                    }
                    Spacer()
                }.padding(.all)
            }
        }.navigationTitle("Login")
    }
}

#Preview {
    LoginView()
}
