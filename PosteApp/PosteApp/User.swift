//
//  User.swift
//  PosteApp
//
//  Created by David Zemlin on 2/29/24.
//

import Foundation

public class User {
    let LOGIN:String
    let FIRST_NAME:String
    let LAST_NAME:String
    let FOLDERS:Array<Folder>
    
    public init(_ login: String, _ firstName: String, _ lastName: String, _ folders: Array<Folder>) {
        self.LOGIN = login
        self.FIRST_NAME = firstName
        self.LAST_NAME = lastName
        self.FOLDERS = folders
    }
    
    public func getFolder(_ folderId: String) -> Folder? {
        var ret:Folder? = nil
        for f in FOLDERS {
            // WIP Pick up here-----------------------------------------
        }
        return ret
    }
}
