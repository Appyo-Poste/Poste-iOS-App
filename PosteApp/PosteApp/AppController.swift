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
    @Published var rootFolder:Folder = Folder("No Folder", nil, nil, nil)
    @Published var activeFolder:Folder = Folder("No Folder", nil, nil, nil)
    @Published var folderCards:[FolderCard] = []
    
    public static func GetAppController() -> AppController {
        if appController == nil {
            appController = AppController()
        }
        appController?.InitializeController()
        return appController!
    }
    
    private func InitializeController() {
        // STUB -------------------------------------------------------------------
        rootFolder = Folder("Welcome Back!", nil, nil, nil)
        activeFolder = rootFolder //Folder("My Folder", "A cool folder of cool stuff", nil, rootFolder)
        rootFolder.folders.append(activeFolder)
        
        var t1 = Folder("Test 1", "111", nil, activeFolder)
        var t2 = Folder("Test 2", "222", nil, activeFolder)
        var t3 = Folder("Test 3", "333", nil, activeFolder)
        
        activeFolder.folders.append(t1)
        activeFolder.folders.append(t2)
        activeFolder.folders.append(t3)
        
        //folderCards.append(FolderCard(shared: activeFolder.isShared(), title: activeFolder.TITLE, conentCount: (activeFolder.folders.count + activeFolder.posts.count)))
        folderCards.append(FolderCard(shared: t1.isShared(), title: t1.TITLE, conentCount: (t1.folders.count + t1.posts.count)))
        folderCards.append(FolderCard(shared: t2.isShared(), title: t2.TITLE, conentCount: (t2.folders.count + t2.posts.count)))
        folderCards.append(FolderCard(shared: t3.isShared(), title: t3.TITLE, conentCount: (t3.folders.count + t3.posts.count)))
                        
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
