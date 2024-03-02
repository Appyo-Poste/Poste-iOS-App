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
    
    public func getFolder(_ folderId: String) -> Folder? {
        var ret:Folder? = nil
        for f in FOLDERS {
            if f.TITLE == folderId {
                ret = f
            }
        }
        return ret
    }
    
    public func getPost(_ postId: String) -> Post? {
        var ret:Post? = nil
        for p in POSTS {
            if p.TITLE == postId {
                ret = p
            }
        }
        return ret
    }
}
