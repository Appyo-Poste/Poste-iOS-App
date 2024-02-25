//
//  Post.swift
//  PosteApp
//
//  Created by David Zemlin on 2/24/24.
//

import Foundation

public class Post {
    let TITLE:String
    let DESCRIPTION:String
    let URL:String
    let ID:String
    let TAGS:Array<String>
    
    public init(title: String, description: String, url: String, id: String, tags: Array<String>) {
        self.TITLE = title
        self.DESCRIPTION = description
        self.URL = url
        self.ID = id
        self.TAGS = tags
    }
}
