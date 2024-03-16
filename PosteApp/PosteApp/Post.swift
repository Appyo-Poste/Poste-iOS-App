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
    let DATE:String
    let URL:String
    let ID:String
    let TAGS:Array<String>
    
    public init(_ title: String, _ description: String, _ date: String , _ url: String, _ id: String, _ tags: Array<String>) {
        self.TITLE = title
        self.DESCRIPTION = description
        self.DATE = date
        self.URL = url
        self.ID = id
        self.TAGS = tags
    }
}
