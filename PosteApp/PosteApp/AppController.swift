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
    
    private static var appController:AppController? = nil
    @Published var activeView:ActiveView = ActiveView.splash
    @Published var username:String = ""
    @Published var dataMod: DataMod = DataMod.GetDataMod()
    
    private init() {
        
    }
    
    public static func GetAppController() -> AppController {
        if appController == nil {
            appController = AppController()
        }
        return appController!
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
        if dataMod.activeFolder.ROOT == "" {
            ret = true
        }
        return ret
    }
}
