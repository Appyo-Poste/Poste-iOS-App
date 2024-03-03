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
        activeFolder = Folder("My Folder", "A cool folder of cool stuff", nil, rootFolder)
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
        return true
    }
    
    public func IsInRoot() -> Bool {
        var ret = false
        if activeFolder.ROOT == nil {
            ret = true
        }
        return ret
    }
}
