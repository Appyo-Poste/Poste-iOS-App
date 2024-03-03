//
//  User.swift
//  PosteApp
//
//  Created by David Zemlin on 2/29/24.
//

import Foundation

public class User {
    let EMAIL:String
    let FIRST_NAME:String
    let LAST_NAME:String
    let FOLDERS:Array<Folder>
    let ROOT: Folder
    
    public init(_ email: String, _ firstName: String, _ lastName: String, _ folders: Array<Folder>, _ root: Folder) {
        self.EMAIL = email
        self.FIRST_NAME = firstName
        self.LAST_NAME = lastName
        self.FOLDERS = folders
        self.ROOT = root
    }
    
    public func getFolder(_ folderId: String) -> Folder? {
        var ret:Folder? = nil
        for f in FOLDERS {
            if f.TITLE == folderId {
                ret = f
            }
        }
        return ret
    }
}
