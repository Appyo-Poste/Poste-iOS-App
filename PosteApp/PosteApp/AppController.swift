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
    }
    
    public static var appController:AppController? = nil
    var activeView:ActiveView = ActiveView.splash
    @Published var username:String = ""

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
    
    public func login() {
        username = "bob"
        print(username)
    }
}
