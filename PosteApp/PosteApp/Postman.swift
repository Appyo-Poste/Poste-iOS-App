//
//  Postman.swift
//  PosteApp
//
//  Created by David Zemlin on 2/9/24.
//

import Foundation

public class Postman {
    public static func loginCall(_ username:String, _ password:String) {
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
    }
}
