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
}
