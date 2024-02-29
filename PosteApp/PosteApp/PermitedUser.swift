//
//  PermitedUser.swift
//  PosteApp
//
//  Created by David Zemlin on 2/28/24.
//

import Foundation

public class PermitedUser {
    let NAME:String
    let ACCESS:Int //0 = None, 1 = Viewer, 2 = Editor, 3 = Full
    
    public init(title: String, access: Int) {
        self.NAME = title
        self.ACCESS = access
    }
}
