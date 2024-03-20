//
//  CurrentData.swift
//  PosteApp
//
//  Created by David Zemlin on 2/10/24.
//

import Foundation
import SwiftUI
import Combine

public class AppController : ObservableObject {
    public enum ActiveView{
        case splash
        case login
        case register
        case folder
    }
    
    public static var appController:AppController? = nil
    @Published var activeView:ActiveView = ActiveView.splash
    @Published var username:String = ""
    @Published var rootFolder:Folder = Folder("No Folder", nil, nil, nil, nil)
    @Published var activeFolder:Folder = Folder("No Folder", nil, nil, nil, nil)
    @Published var folderCards:[FolderCard] = []
    @Published var postCards:[PostCard] = []
    
    public static func GetAppController() -> AppController {
        if appController == nil {
            appController = AppController()
        }
        appController?.InitializeController()
        return appController!
    }
    
    private func InitializeController() {
        // STUB -------------------------------------------------------------------
        rootFolder = Folder("Welcome Back!", nil, nil, nil, nil)
        activeFolder = rootFolder //Folder("My Folder", "A cool folder of cool stuff", nil, rootFolder)
        rootFolder.folders.append(activeFolder)
        
        var t1 = Folder("Test 1", "111", "01/01/01", nil, activeFolder)
        var t2 = Folder("Test 2", "222", "01/02/02", nil, activeFolder)
        var t3 = Folder("Test 3", "333", "01/03/03", nil, activeFolder)
        
        var g1: Array<String> = Array()
        var g2: Array<String> = Array()
        var g3: Array<String> = Array()
        var g4: Array<String> = Array()
        
        var p1 = Post("Post 1", "number one", "01/01/01", "www.youtube.com", "1", g1)
        var p2 = Post("Post 2", "number two", "01/02/01", "www.youtube.com", "2", g2)
        var p3 = Post("Post 3", "number three", "01/03/02", "www.youtube.com", "3", g3)
        var p4 = Post("Post 4", "number four", "01/04/03", "www.youtube.com", "4", g4)
        
        /*
         let TITLE:String
         let DESCRIPTION:String
         let URL:String
         let ID:String
         let TAGS:Array<String>
         */
        
        activeFolder.folders.append(t1)
        activeFolder.folders.append(t2)
        activeFolder.folders.append(t3)
        activeFolder.posts.append(p1)
        activeFolder.posts.append(p2)
        activeFolder.posts.append(p3)
        activeFolder.posts.append(p4)
        
        //folderCards.append(FolderCard(shared: activeFolder.isShared(), title: activeFolder.TITLE, conentCount: (activeFolder.folders.count + activeFolder.posts.count)))
        
        folderCards.append(FolderCard(folder: t1, shared: t1.isShared(), title: t1.TITLE, date: t1.DATE ?? "NO DATE", conentCount: (t1.folders.count + t1.posts.count)))
        folderCards.append(FolderCard(folder: t2, shared: t2.isShared(), title: t2.TITLE, date: t2.DATE ?? "NO DATE", conentCount: (t2.folders.count + t2.posts.count)))
        folderCards.append(FolderCard(folder: t3, shared: t3.isShared(), title: t3.TITLE, date: t3.DATE ?? "NO DATE", conentCount: (t3.folders.count + t3.posts.count)))
        
        postCards.append(PostCard(url: p1.URL, title: p1.TITLE, date: p1.DATE))
        postCards.append(PostCard(url: p2.URL, title: p2.TITLE, date: p2.DATE))
        postCards.append(PostCard(url: p3.URL, title: p3.TITLE, date: p3.DATE))
        postCards.append(PostCard(url: p4.URL, title: p4.TITLE, date: p4.DATE))
                        
        // -------------------------------------------------------------------------
    }
    
    public func SetActiveView (_ newView:ActiveView) {
        activeView = newView
    }
    public func GetActiveView() -> ActiveView {
        return activeView
    }
    
    public func login(_ username:String, _ password:String) -> Bool {
        var result:Bool
        result = Postman.loginCall(self, username, password)
        return result
    }
    
    public func Register(_ email:String, _ firstName:String, _ lastName:String, _ password:String) -> Bool {
        var result:Bool
        result = Postman.RegisterCall(self, email, firstName, lastName, password)
        return result
    }
    
    public func IsInRoot() -> Bool {
        var ret = false
        if activeFolder.ROOT == nil {
            ret = true
        }
        return ret
    }
}
