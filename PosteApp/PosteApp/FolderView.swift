//
//  FolderView.swift
//  PosteApp
//
//  Created by David Zemlin on 2/14/24.
//

import SwiftUI

// STUB: for the FolderView page
struct FolderView: View {

    @State private var search = ""
    @State private var startViewChange = false
    @StateObject var appCon = AppController.GetAppController()
    
    // Function to handle the "Back" Button being clicked
    func BackPressed() {
        startViewChange = true
        appCon.SetActiveView(AppController.ActiveView.login)
    }
    
    func SearchPressed() {
        // STUB ----------------------------------------------
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
                VStack(alignment: .leading) {
                    HStack(alignment: .center){
                        VStack(alignment: .leading) {
                            if !appCon.IsInRoot() {
                                Button(action: BackPressed) {
                                    Label("Dashboard", systemImage: "arrow.backward").foregroundColor(.posteGrey)
                                }.padding(.top)
                            }
                            Text(appCon.activeFolder.TITLE)
                                .font(.largeTitle)
                                .multilineTextAlignment(.center)
                                .bold()
                                .fontWeight(.heavy)
                                .padding(.leading, 24.0)
                        }
                        Spacer()
                        Image("PosteLogo").resizable().aspectRatio(contentMode: .fit).frame(height: 80.0)
                    }.frame(maxHeight: 80)
                    
                    if !appCon.IsInRoot() {
                        if appCon.activeFolder.DESCRIPTION != nil {
                            Text((appCon.activeFolder.DESCRIPTION)!)
                                .font(.subheadline)
                                .multilineTextAlignment(.leading)
                                .padding(.leading, 24.0).foregroundColor(.posteGrey)
                        }
                    }
                    HStack {
                        Button(action: SearchPressed) {
                            Image(systemName: "magnifyingglass").aspectRatio(contentMode: .fit).foregroundColor(.posteGrey).frame(width:5)
                        }.padding()
                        TextField("Search Here", text: $search).padding().frame(width: 300, height: 50).background(Color.black.opacity(0.10)).cornerRadius(10.0).keyboardType(.emailAddress/*@END_MENU_TOKEN@*/).textContentType(/*@START_MENU_TOKEN@*/.emailAddress).autocapitalization(.none)
                    }
                    HStack {
                        Button("New Post") {
                            // STUB -----------------------------------
                        }
                        .padding()
                        .foregroundColor(.black)
                        .frame(width: 110, height: 30)
                        .background(Color("mainLight"))
                        .cornerRadius(10).font(.footnote)
                        Button("New Folder") {
                            // STUB -----------------------------------
                        }
                        .padding()
                        .foregroundColor(.black)
                        .frame(width: 110, height: 30)
                        .background(Color("mainLight"))
                        .cornerRadius(10).font(.footnote)
                        Button("Share Folder") {
                            // STUB -----------------------------------
                        }
                        .padding()
                        .foregroundColor(.black)
                        .frame(width: 110, height: 30)
                        .background(Color("mainLight"))
                        .cornerRadius(10).font(.footnote)
                    }
                    List(appCon.folderCards) { folderCard in
                        HStack {
                            VStack {
                                if folderCard.shared {
                                    Image(systemName: "folder.fill.badge.person.crop").resizable().aspectRatio(contentMode: .fit).frame(width: 30)
                                }
                                else {
                                    Image(systemName: "folder.fill").resizable().aspectRatio(contentMode: .fit).frame(width: 30)
                                }
                                Text(String(folderCard.conentCount) + " Posts").frame(width: 80.0)
                            }
                            Text(folderCard.title).frame(width: 100.0)
                            Text(folderCard.date).frame(width: 80.0)
                            Spacer()
                            Image(systemName: "ellipsis").resizable().aspectRatio(contentMode: .fit).frame(width: 40
                            )
                        }
                    }
                    .listStyle(.plain)
                    .frame(height: 150).background(Color(hue: 1.0, saturation: 0.0, brightness: 0.9))
                    List(appCon.postCards) { postCard in
                        HStack {
                            VStack {
                                HStack {
                                    Spacer()
                                    Image(systemName: "pencil.circle.fill").resizable().aspectRatio(contentMode: .fit).frame(width: 40)
                                        .foregroundStyle(Color("mainLight"))
                                }.frame(width: 100.0)
                                Text(postCard.title).font(.title).frame(width: 100.0)
                                Image(systemName: "doc").resizable().aspectRatio(contentMode: .fit).frame(width: 30)
                                Text(postCard.date).frame(width: 80.0)
                            }
                        }
                    }.frame(height: 390).background(Color(hue: 1.0, saturation: 0.0, brightness: 0.9))
                    Spacer()
                }.padding(.all)
            }
        }.navigationTitle("Folder View")
    }
}

#Preview {
    FolderView()
}
