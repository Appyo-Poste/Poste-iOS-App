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
    
    public func SetDashboardFolder(_ dashboard: String) {
        dashBoardFolder = Postman.GetFolder(folderName: dashboard)!
        SetActiveFolder(dashboard)
    }
    
    public func SetActiveFolder(_ active: String) {
        var nextFolder = Postman.GetFolder(folderName: active)
        if (nextFolder != nil) {
            activeFolder = nextFolder!
            CreateMenuCards(newActiveFolder: activeFolder)
        }
    }
    
    public func CreateMenuCards(newActiveFolder: Folder) {
        folderCards.removeAll()
        postCards.removeAll()
        for f in newActiveFolder.folders {
            var subFolder = Postman.GetFolder(folderName: f)
            if (subFolder != nil) {
                folderCards.append(FolderCard(folder: subFolder!,
                                              shared: subFolder!.isShared(),
                                              title: subFolder!.TITLE,
                                              date: subFolder!.DATE ?? "NO DATE",
                                              conentCount: (subFolder!.folders.count + subFolder!.posts.count)))
            }
        }
        for p in newActiveFolder.posts {
            postCards.append(PostCard(url: p.URL, title: p.TITLE, date: p.DATE))
        }
    }
    
    private func CreateDebugData() {
        dashBoardFolder = Folder("Test Dash", nil, nil, nil, "")
        activeFolder = dashBoardFolder
        dashBoardFolder.folders.append(activeFolder.TITLE)
        
        var t1 = Folder("Test 1", "111", "01/01/01", nil, activeFolder.TITLE)
        var t2 = Folder("Test 2", "222", "01/02/02", nil, activeFolder.TITLE)
        var t3 = Folder("Test 3", "333", "01/03/03", nil, activeFolder.TITLE)
        
        var g1: Array<String> = Array()
        var g2: Array<String> = Array()
        var g3: Array<String> = Array()
        var g4: Array<String> = Array()
        
        var p1 = Post("Post 1", "number one", "01/01/01", "https://www.youtube.com", "17", g1)
        var p2 = Post("Post 2", "number two", "01/02/01", "https://www.youtube.com", "18", g2)
        var p3 = Post("Post 3", "number three", "01/03/02", "https://www.youtube.com", "19", g3)
        var p4 = Post("Post 4", "number four", "01/04/03", "https://www.youtube.com", "20", g4)
        
        activeFolder.folders.append(t1.TITLE)
        activeFolder.folders.append(t2.TITLE)
        activeFolder.folders.append(t3.TITLE)
        activeFolder.posts.append(p1)
        activeFolder.posts.append(p2)
        activeFolder.posts.append(p3)
        activeFolder.posts.append(p4)
        
        CreateMenuCards(newActiveFolder: activeFolder)
    }
}
