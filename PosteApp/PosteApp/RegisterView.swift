//
//  ContentView.swift
//  PosteApp
//
//  Created by David Zemlin on 2/6/24.
//

import SwiftUI

// This View runs the UI for the Login page. It takes the user input and interpets it down to the AppController to run the desired function calls. It also serves as a navigation point beteewn the register and folder pages.
struct RegisterView: View {
    @State private var email = ""
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var password = ""
    @State private var passwordConfirm = ""
    @State private var startViewChange = false
    @StateObject var appCon = AppController.GetAppController()
    
    // Function to handle the "Back" Button being clicked
    func BackPressed() {
        startViewChange = true
        appCon.SetActiveView(AppController.ActiveView.login)
    }
    
    // Function to handle the "Register" Button being clicked
    func RegisterPressed() {
        var goodEmail = ValidateEmail()
        var goodNames = ValidateName()
        var goodPassword = ValidatePassword()
        
        if goodEmail && goodNames && goodPassword {
            print("Send regestration")
            if appCon.Register(email, firstName, lastName, password) {
                startViewChange = true
                appCon.SetActiveView(AppController.ActiveView.login)
            }
        }
        else {
            if !goodEmail {
                print("Email format incorrect")
            }
            if !goodNames {
                print("First and/or Last name format incorrect")
            }
            if !goodPassword {
                print("Password format incorrect")
                print("Rules:")
                print("     Must be 8 to 32 cahacters long")
                print("     Must have at least one upper case character")
                print("     Must have at least one lower case character")
                print("     Must have at least one digit")
            }
            print("Bad registration")
        }
    }
    
    // Function to check if the email is valid
    func ValidateEmail() -> Bool {
        if email == "" {
            return false
        }
        if email.hasSuffix(".") {
            return false
        }
        let emailSig = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailFront = NSPredicate(format: "SELF MATCHES %@", emailSig)
        return emailFront.evaluate(with: email)
    }
    
    // Function to check if the names are valid
    func ValidateName() -> Bool {
        if firstName == "" {
            return false
        }
        if lastName == "" {
            return false
        }
        return true
    }
    
    // Function to check if the names are valid
    func ValidatePassword() -> Bool {
        if password.count < 8 {
            return false
        }
        
        if password != passwordConfirm {
            print("passwords must match")
            return false
        }
        
        let numFilter = ".*[0-9]+.*"
        let numPred = NSPredicate(format: "SELF MATCHES %@", numFilter)
        var hasNumber = numPred.evaluate(with: password)
        if !hasNumber {
            print("password must have a digit from 0-9 in it")
            return false
        }
        
        let lowFilter = ".*[a-z]+.*"
        let lowPred = NSPredicate(format: "SELF MATCHES %@", lowFilter)
        var hasLower = lowPred.evaluate(with: password)
        if !hasLower {
            print("password must have a lower case letter in it")
            return false
        }

        
        let uppFilter = ".*[A-Z]+.*"
        let uppPred = NSPredicate(format: "SELF MATCHES %@", uppFilter)
        var hasUpper = uppPred.evaluate(with: password)
        if !hasUpper {
            print("password must have an upper case letter in it")
            return false
        }
        
        return true
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
                        Text("Register")
                            .font(.largeTitle)
                            .multilineTextAlignment(.center)
                            .bold()
                            .fontWeight(.heavy)
                            .padding([.top, .leading, .bottom])
                        Spacer()
                    }
                    HStack {
                        TextField("Email Address", text: $email).padding(.leading).frame(width: 300, height: 50).background(Color.black.opacity(0.15)).cornerRadius(10.0).keyboardType(/*@START_MENU_TOKEN@*/.emailAddress/*@END_MENU_TOKEN@*/).textContentType(/*@START_MENU_TOKEN@*/.emailAddress/*@END_MENU_TOKEN@*/).autocapitalization(.none)
                    }
                    HStack {
                        TextField("First Name", text: $firstName).padding(.horizontal)
                            .frame(width: 300, height: 50)
                            .background(Color.black.opacity(0.15))
                            .cornerRadius(10.0).textContentType(/*@START_MENU_TOKEN@*/.givenName/*@END_MENU_TOKEN@*/)
                            .lineLimit(32)
                            .autocapitalization(.none)
                    }
                    .padding(/*@START_MENU_TOKEN@*/.horizontal/*@END_MENU_TOKEN@*/)
                    HStack {
                        TextField("Last Name", text: $lastName).padding(.horizontal)
                            .frame(width: 300, height: 50)
                            .background(Color.black.opacity(0.15))
                            .cornerRadius(10.0).textContentType(.familyName)
                            .lineLimit(32)
                            .autocapitalization(.none)
                    }
                    .padding(/*@START_MENU_TOKEN@*/.horizontal/*@END_MENU_TOKEN@*/)
                    HStack {
                        SecureField("Password", text: $password).padding(.horizontal)
                            .frame(width: 300, height: 50)
                            .background(Color.black.opacity(0.15))
                            .cornerRadius(10.0).textContentType(/*@START_MENU_TOKEN@*/.newPassword/*@END_MENU_TOKEN@*/)
                            .lineLimit(32)
                            .autocapitalization(.none)
                    }
                    .padding(/*@START_MENU_TOKEN@*/.horizontal/*@END_MENU_TOKEN@*/)
                    HStack {
                        SecureField("Confirm Password", text: $passwordConfirm).padding(.horizontal)
                            .frame(width: 300, height: 50)
                            .background(Color.black.opacity(0.15))
                            .cornerRadius(10.0).textContentType(/*@START_MENU_TOKEN@*/.newPassword/*@END_MENU_TOKEN@*/)
                            .lineLimit(32)
                            .autocapitalization(.none)
                    }
                    .padding(/*@START_MENU_TOKEN@*/[.leading, .bottom, .trailing]/*@END_MENU_TOKEN@*/)
                    Button("Register") {
                        RegisterPressed()
                    }
                    .padding()
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(Color("mainLight"))
                    .cornerRadius(20)
                    Button("Back") {
                        BackPressed()
                    }
                    .padding()
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(Color("mainDark"))
                    .cornerRadius(20)
                    Spacer()
                }.padding(.all)
            }
        }.navigationTitle("Register")
    }
}

#Preview {
    RegisterView()
}
