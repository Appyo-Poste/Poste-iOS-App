//
//  PostCard.swift
//  PosteApp
//
//  Created by David Zemlin on 3/16/24.
//

import Foundation

struct PostCard: Identifiable{
    var id: UUID = UUID()
    
    var url:String
    var title:String
    var date:String
}
