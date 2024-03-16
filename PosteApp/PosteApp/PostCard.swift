//
//  PostCard.swift
//  PosteApp
//
//  Created by David Zemlin on 3/16/24.
//

import Foundation

struct PostCard: Identifiable{
    var id: UUID = UUID()
    
    var post:Post
    var title:String
    var date:String
}
