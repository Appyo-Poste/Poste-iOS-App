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
        if username == "Admin@email.com" && password == "Admin1234" {
            print("Password Correct")
            appController.username = username
            
            var dash:Folder? = GetFolder(folderName: "Dashboard")
            if (dash != nil) {
                dataMod.dashBoardFolder = dash!
            }
            dataMod.SetDashboardFolder("Dashboard")
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
    // This will need a propety for a token or a user identification once the server compatable version is built
    public static func GetFolder(folderName: String) -> Folder? {
        var ret: Folder? = nil
        
        var tags1: Array<String> = Array()
        var tags2: Array<String> = Array()
        tags1.append("cool")
        var pUser1 = PermitedUser(title: "bob@bob.com", access: 3)
        var pUser2 = PermitedUser(title: "joe@joe.com", access: 2)
        var pUser3 = PermitedUser(title: "tim@tim.com", access: 1)
        
        if folderName == "Dashboard" {
            // create folder
            ret = Folder("Dashboard", nil, nil, nil, "")
            
            // add subfolder
            ret?.folders.append("Cool Stuff")
            ret?.folders.append("Cat videos")
            
            // add posts
            var p1 = Post("Unsorted Post", "I need to make a folder for this", "01/01/01", "https://www.youtube.com", "1", tags1)
            var p2 = Post("Epic", "Wow just wow", "01/01/01", "https://www.youtube.com", "2", tags1)
            var p3 = Post("Grandma", "Gma will like this", "01/01/01", "https://www.youtube.com", "3", tags2)
            var p4 = Post("Cant Unsee", "what did I just watch?", "01/01/01", "https://www.youtube.com", "4", tags2)
            
            ret?.posts.append(p1)
            ret?.posts.append(p2)
            ret?.posts.append(p3)
            ret?.posts.append(p4)
        }
        else if folderName == "Cool Stuff" {
            // create folder
            var shares: Array<PermitedUser> = Array()
            shares.append(pUser1)
            shares.append(pUser2)
            shares.append(pUser3)
            ret = Folder("Cool Stuff", "Neat things I like", "01/01/01", shares, "Dashboard")
            
            // add subfolder
            ret?.folders.append("Really Cool Stuff")
            ret?.folders.append("Kinda Cool Stuff")
            
            // add posts
            var p1 = Post("Cool Bike", "BMX bike", "01/01/01", "https://www.youtube.com", "5", tags1)
            var p2 = Post("Cool Dog", "Corgi", "01/01/01", "https://www.youtube.com", "6", tags2)
            
            ret?.posts.append(p1)
            ret?.posts.append(p2)
        }
        else if folderName == "Cat videos" {
            // create folder
            ret = Folder("Cool Stuff", "Neat things I like", "01/01/01", nil, "Dashboard")
            
            // add posts
            var p1 = Post("So Cute!", "The Cutest Cat", "01/01/01", "https://www.youtube.com", "7", tags1)
            var p2 = Post("Funny Cat", "Cat falls on easy jump", "01/01/01", "https://www.youtube.com", "8", tags2)
            
            var p3 = Post("Master Cat", "Cat rules the house", "01/01/01", "https://www.youtube.com", "9", tags2)
            var p4 = Post("Invisable Cat", "Black cat in window at night", "01/01/01", "https://www.youtube.com", "10", tags2)
            var p5 = Post("Rat Cat", "Kitty's First Bath", "01/01/01", "https://www.youtube.com", "8", tags2)
            var p6 = Post("Launch Cat", "Cat gets spooked and goes airborn", "01/01/01", "https://www.youtube.com", "11", tags2)
            var p7 = Post("Mobile Cat", "Cat rides vacume bot", "01/01/01", "https://www.youtube.com", "12", tags2)
            
            ret?.posts.append(p1)
            ret?.posts.append(p2)
            ret?.posts.append(p3)
            ret?.posts.append(p4)
            ret?.posts.append(p5)
            ret?.posts.append(p6)
            ret?.posts.append(p7)
        }
        else if folderName == "Really Cool Stuff" {
            // create folder
            var shares: Array<PermitedUser> = Array()
            shares.append(pUser1)
            shares.append(pUser2)
            ret = Folder("Cool Stuff", "Neat things I like", "01/01/01", shares, "Cool Stuff")
            
            // add posts
            var p1 = Post("The Coolest Bike", "Hover Bike", "01/01/01", "https://www.youtube.com", "13", tags1)
            var p2 = Post("The Coolest Dog", "Corgi with sunglasses", "01/01/01", "https://www.youtube.com", "14", tags2)
            
            ret?.posts.append(p1)
            ret?.posts.append(p2)
        }
        else if folderName == "Kinda Cool Stuff" {
            // create folder
            var shares: Array<PermitedUser> = Array()
            shares.append(pUser3)
            ret = Folder("Kinda Cool Stuff", "Sorta cool I guess", "01/01/01", shares, "Cool Stuff")
            
            // add posts
            var p1 = Post("80's cartoon", "Some guy with a sword and a tiger", "01/01/01", "https://www.youtube.com", "15", tags1)
            var p2 = Post("Water Gun Backyard Free 4 All", "Cool and wet", "01/01/01", "https://www.youtube.com", "16", tags2)
            
            ret?.posts.append(p1)
            ret?.posts.append(p2)
        }
        else if folderName == "Test 1" {
            // create folder
            ret = Folder("Test 1", "111", "01/01/01", nil, "Dashboard")
        }
        else if folderName == "Test 2" {
            // create folder
            ret = Folder("Test 2", "111", "01/02/02", nil, "Dashboard")
        }
        else if folderName == "Test 3" {
            // create folder
            ret = Folder("Test 3", "111", "01/03/03", nil, "Dashboard")
        }
        
        if (ret != nil) {
            
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
