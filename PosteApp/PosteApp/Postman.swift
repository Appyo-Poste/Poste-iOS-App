//
//  Postman.swift
//  PosteApp
//
//  Created by David Zemlin on 2/9/24.
//

import Foundation

// This class handles making all API calls to the back end and returning the useful data to the APPcontroller
public class Postman {
    // STUB DATA MODLE
    static var dataMod = DataMod.GetDataMod()
    static var stubNewUser:String = ""
    static var stubNewFirstName:String = ""
    static var stubNewLastName:String = ""
    static var stubNewPass:String = ""
    
    // STUB: Currently this method simulates a call to the backend.
    public static func RegisterCall(_ appController:AppController, _ username:String, _ firstName:String, _ lastName:String, _ password:String) -> Bool {
        stubNewUser = username
        stubNewFirstName = firstName
        stubNewLastName = lastName
        stubNewPass = password
        if username == "Admin@email.com" {
            print("User already exists")
            return false
        }
        else {
            print("User Added")
            return true
        }
    }
    
    // STUB: Currently this method simulates a call to the backend.
    public static func loginCall(_ appController:AppController, _ username:String, _ password:String) -> Bool {
        if username == "Admin@email.com" && password == "admin1234" {
            print("Password Correct")
            appController.username = username
            
            dataMod.dashBoardFolder = Folder("Welcome Back!", nil, nil, nil, "")
            dataMod.activeFolder = dataMod.dashBoardFolder
            dataMod.dashBoardFolder.folders.append(dataMod.activeFolder)
            
            //dataMod.dashBoardFolder.folders = GetFolder(token: string, folder: string)
            var t1 = Folder("Cool Stuff", "Neat things I like", "01/01/01", nil, dataMod.activeFolder.TITLE)
            var t2 = Folder("Cat videos", "Cute cats doing cute things", "01/02/02", nil, dataMod.activeFolder.TITLE)
            var t3 = Folder("Hobbies", "Stuff related to my hobbies", "01/03/03", nil, dataMod.activeFolder.TITLE)
            
            var g1: Array<String> = Array()
            var g2: Array<String> = Array()
            var g3: Array<String> = Array()
            var g4: Array<String> = Array()
            
            var p1 = Post("Post 1", "number one", "01/01/01", "www.youtube.com", "1", g1)
            var p2 = Post("Post 2", "number two", "01/02/01", "www.youtube.com", "2", g2)
            var p3 = Post("Post 3", "number three", "01/03/02", "www.youtube.com", "3", g3)
            var p4 = Post("Post 4", "number four", "01/04/03", "www.youtube.com", "4", g4)
            
            //activeFolder.folders.append(t1)
            //activeFolder.folders.append(t2)
            //activeFolder.folders.append(t3)
            //activeFolder.posts.append(p1)
            //activeFolder.posts.append(p2)
            //activeFolder.posts.append(p3)
            //activeFolder.posts.append(p4)
            
            //folderCards.append(FolderCard(folder: t1, shared: t1.isShared(), title: t1.TITLE, date: t1.DATE ?? "NO DATE", conentCount: (t1.folders.count + t1.posts.count)))
            //folderCards.append(FolderCard(folder: t2, shared: t2.isShared(), title: t2.TITLE, date: t2.DATE ?? "NO DATE", conentCount: (t2.folders.count + t2.posts.count)))
            //folderCards.append(FolderCard(folder: t3, shared: t3.isShared(), title: t3.TITLE, date: t3.DATE ?? "NO DATE", conentCount: (t3.folders.count + t3.posts.count)))
            
            //postCards.append(PostCard(url: p1.URL, title: p1.TITLE, date: p1.DATE))
            //postCards.append(PostCard(url: p2.URL, title: p2.TITLE, date: p2.DATE))
            //postCards.append(PostCard(url: p3.URL, title: p3.TITLE, date: p3.DATE))
            //postCards.append(PostCard(url: p4.URL, title: p4.TITLE, date: p4.DATE))
            return true
        }
        else if username == stubNewUser && password == stubNewPass {
            if stubNewPass != "" && stubNewUser != "" {
                print("Password Correct")
                appController.username = username
                return true
            }
        }
        else {
            print("Password Wrong")
            return false
        }
        
        return false
    }
    
    // STUB: Currently this method simulates a call to the backend.
    public static func GetFolder(token: String, folderName: String) -> Folder? {
        var ret: Folder? = nil
        
        var tags1: Array<String> = Array()
        var tags2: Array<String> = Array()
        tags1.append("cool")
        if folderName == "Dashboard" {
            ret = Folder("Dashboard", nil, nil, nil, "")
            
            
            ret?.folders.append(GetFolder(token: "token", folderName: "Cool Stuff")!)
            ret?.folders.append(GetFolder(token: "token", folderName: "Cat videos")!)
            
            var p1 = Post("Unsorted Post", "I need to make a folder for this", "01/01/01", "www.youtube.com", "1", tags1)
            var p2 = Post("Epic", "Wow just wow", "01/01/01", "www.youtube.com", "2", tags1)
            var p3 = Post("Grandma", "Gma will like this", "01/01/01", "www.youtube.com", "3", tags2)
            var p4 = Post("Cant Unsee", "what did I just watch?", "01/01/01", "www.youtube.com", "4", tags2)
            
            ret?.posts.append(p1)
            ret?.posts.append(p2)
            ret?.posts.append(p3)
            ret?.posts.append(p4)
        
            /*
        else if folderName == "Cool Stuff" {
            var shares: Array<PermitedUser> = Array()
            var pUser1 = PermitedUser(title: "bob@bob.com", access: 3)
            var pUser2 = PermitedUser(title: "joe@joe.com", access: 2)
            var pUser3 = PermitedUser(title: "tim@tim.com", access: 1)
            shares.append(pUser1)
            shares.append(pUser2)
            shares.append(pUser3)
            
            ret = Folder("Cool Stuff", "Neat things I like", "01/01/01", shares, "Welcome Back!")
            
            ret?.folders.append(Folder("Really Cool Stuff", "super awesome", "01/01/01", shares, ret))
            ret?.folders.append(Folder("sorta Cool Stuff", "super awesome", "01/01/01", nil, ret))
            
            var tags1: Array<String> = Array()
            var tags2: Array<String> = Array()
            tags1.append("cool")
            
            var p1 = Post("Cool Bike", "BMX bike", "01/01/01", "www.youtube.com", "1", tags1)
            var p2 = Post("Cool Dog", "Corgi", "01/01/01", "www.youtube.com", "2", tags2)
            
            ret?.posts.append(p1)
            ret?.posts.append(p2)
        }
        else if folderName == "Cat videos" {
            ret = Folder("Cat videos", "Cute cats doing cute things", "01/02/02", nil, dataMod.activeFolder)
            
            ret?.folders.append(Folder("Really Cool Stuff", "super awesome", "01/01/01", shares, ret))
            ret?.folders.append(Folder("sorta Cool Stuff", "super awesome", "01/01/01", nil, ret))
            
            var tags1: Array<String> = Array()
            var tags2: Array<String> = Array()
            tags1.append("cool")
            
            var p1 = Post("Cool Bike", "BMX bike", "01/01/01", "www.youtube.com", "1", tags1)
            var p2 = Post("Cool Dog", "Corgi", "01/01/01", "www.youtube.com", "2", tags2)
            
            ret?.posts.append(p1)
            ret?.posts.append(p2)
            */
        }
        return ret
    }
        /* WORK IN PROGRESS API Call for loggin in
        print("login" + username + password)
        let url = URL(string: "https://10.0.2.2/api/login/")
        
        guard url != nil else {
            print("Error creating url object")
            return
        }
        
        var request = URLRequest(url: url!, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10)
        
        let headers = [
            "content-type":"application/json"
        ]
        
        request.allHTTPHeaderFields = headers
        let body = [
            "email":"admin@email.com",
            "password":"admin1234"
        ] as [String:Any]
        
        do {
            let requestBody = try  JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
            request.httpBody = requestBody
        }
        catch {
            print("Error forming data object")
        }
        request.httpMethod = "POST"
        
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            
            if error == nil && data != nil {
                do {
                    let dictionary = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? [String:Any]
                    print(dictionary)
                }
                catch {
                    print("Error parsing responce")
                }
            }
            else {
                print(error)
            }
        }
        dataTask.resume()
         */
}
