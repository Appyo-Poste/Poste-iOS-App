//
//  Postman.swift
//  PosteApp
//
//  Created by David Zemlin on 2/9/24.
//

import Foundation

// This class handles making all API calls to the back end and returning the useful data to the APPcontroller
public class Postman {
    
    // This fuction attemps to log in. it wil return true if the login was successful, and it will pass all reponce date to the AppController passed as the first parameter.
    // STUB: Currently this method simulates a call to the backend.
    public static func loginCall(_ appController:AppController, _ username:String, _ password:String) -> Bool {
        // STUB LOGIN START
        if username == "Admin@email.com" && password == "admin1234" {
            print("Password Correct")
            appController.username = username
            return true
        }
        else {
            print("Password Wrong")
            return false
        }
        // STUB LOGIN END
        
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
