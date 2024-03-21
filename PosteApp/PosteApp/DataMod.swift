//
//  DataMod.swift
//  PosteApp
//
//  Created by David Zemlin on 3/20/24.
//

import Foundation

public class DataMod {
    
    private static var dataMod:DataMod? = nil
    @Published var dashBoardFolder:Folder = Folder("No Folder", nil, nil, nil, "")
    @Published var activeFolder:Folder = Folder("No Folder", nil, nil, nil, "")
    @Published var folderCards:[FolderCard] = []
    @Published var postCards:[PostCard] = []
    
    private init() {
    }
    
    public static func GetDataMod() -> DataMod {
        if  dataMod == nil {
            dataMod = DataMod()
            dataMod?.CreateDebugData()
        }
        return dataMod!
    }
    
    public func SetDashboardFolder(_ dashboard: Folder) {
        dashBoardFolder = dashboard
    }
    
    public func SetActiveFolder(_ active: Folder) {
        activeFolder = active;
    }
    
    private func CreateDebugData() {
        dashBoardFolder = Folder("Test Dash", nil, nil, nil, "")
        activeFolder = dashBoardFolder
        dashBoardFolder.folders.append(activeFolder)
        
        var t1 = Folder("Test 1", "111", "01/01/01", nil, activeFolder.TITLE)
        var t2 = Folder("Test 2", "222", "01/02/02", nil, activeFolder.TITLE)
        var t3 = Folder("Test 3", "333", "01/03/03", nil, activeFolder.TITLE)
        
        var g1: Array<String> = Array()
        var g2: Array<String> = Array()
        var g3: Array<String> = Array()
        var g4: Array<String> = Array()
        
        var p1 = Post("Post 1", "number one", "01/01/01", "www.youtube.com", "1", g1)
        var p2 = Post("Post 2", "number two", "01/02/01", "www.youtube.com", "2", g2)
        var p3 = Post("Post 3", "number three", "01/03/02", "www.youtube.com", "3", g3)
        var p4 = Post("Post 4", "number four", "01/04/03", "www.youtube.com", "4", g4)
        
        activeFolder.folders.append(t1)
        activeFolder.folders.append(t2)
        activeFolder.folders.append(t3)
        activeFolder.posts.append(p1)
        activeFolder.posts.append(p2)
        activeFolder.posts.append(p3)
        activeFolder.posts.append(p4)
        
        folderCards.append(FolderCard(folder: t1, shared: t1.isShared(), title: t1.TITLE, date: t1.DATE ?? "NO DATE", conentCount: (t1.folders.count + t1.posts.count)))
        folderCards.append(FolderCard(folder: t2, shared: t2.isShared(), title: t2.TITLE, date: t2.DATE ?? "NO DATE", conentCount: (t2.folders.count + t2.posts.count)))
        folderCards.append(FolderCard(folder: t3, shared: t3.isShared(), title: t3.TITLE, date: t3.DATE ?? "NO DATE", conentCount: (t3.folders.count + t3.posts.count)))
        
        postCards.append(PostCard(url: p1.URL, title: p1.TITLE, date: p1.DATE))
        postCards.append(PostCard(url: p2.URL, title: p2.TITLE, date: p2.DATE))
        postCards.append(PostCard(url: p3.URL, title: p3.TITLE, date: p3.DATE))
        postCards.append(PostCard(url: p4.URL, title: p4.TITLE, date: p4.DATE))
    }
}
