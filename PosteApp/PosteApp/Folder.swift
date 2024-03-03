//
//  Folder.swift
//  PosteApp
//
//  Created by David Zemlin on 2/28/24.
//

import Foundation

public class Folder {
    let TITLE:String
    let DESCRIPTION:String?
    let SHARES:Array<PermitedUser>?
    let ROOT:Folder?
    var folders:Array<Folder> = Array()
    var posts:Array<Post> = Array()
    
    public init(_ title: String, _ description: String? , _ shares: Array<PermitedUser>?, _ root: Folder?) {
        self.TITLE = title
        self.DESCRIPTION = description
        self.SHARES = shares
        self.ROOT = root
    }
    
    public func getFolder(_ folderId: String) -> Folder? {
        var ret:Folder? = nil
        if folders.isEmpty {
            return ret
        }
        for f in folders {
            if f.TITLE == folderId {
                ret = f
            }
        }
        return ret
    }
    
    public func getPost(_ postId: String) -> Post? {
        var ret:Post? = nil
        if posts.isEmpty {
            return ret
        }
        for p in posts {
            if p.TITLE == postId {
                ret = p
            }
        }
        return ret
    }
}
