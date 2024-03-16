//
//  FolderCard.swift
//  PosteApp
//
//  Created by David Zemlin on 3/13/24.
//

import Foundation

struct FolderCard: Identifiable{
    var id: UUID = UUID()
    
    var folder:Folder
    var shared:Bool
    var title:String
    var date:String
    var conentCount:Int
}
