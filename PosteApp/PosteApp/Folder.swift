//
//  Folder.swift
//  PosteApp
//
//  Created by David Zemlin on 2/28/24.
//

import Foundation

public class Folder {
    let TITLE:String
    let SHARES:Array<PermitedUser>
    let ROOT:Folder?
    let FOLDERS:Array<Folder>
    let POSTS:Array<Post>
    
    public init(_ title: String, _ shares: Array<PermitedUser>, _ root: Folder?, _ folders: Array<Folder>, _ posts: Array<Post>) {
        self.TITLE = title
        self.SHARES = shares
        self.ROOT = root
        self.FOLDERS = folders
        self.POSTS = posts
    }
}
