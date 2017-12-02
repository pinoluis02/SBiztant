//
//  UserAccounts.swift
//  TestingVisa
//
//  Created by Juan Mondragon on 12/2/17.
//  Copyright © 2017 Juan Mondragon. All rights reserved.
//
import Foundation
class  UserAccounts {
    
    let headers = [
        "accept": "application/json",
        "content-type": "application/json",
        "cache-control": "no-cache",
        "postman-token": "1137c1f5-dbb6-bf45-80ad-31494b95aa5e"
    ]
    let parameters = ["LegalParticipantIdentifier": "913995730031830909"] as [String : Any]
    
    func requestAccounts(for user: String) {
        
        guard let postData = try? JSONSerialization.data(withJSONObject: parameters, options: []) else { return }
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://api119525live.gateway.akana.com/user/accounts")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers
        request.httpBody = postData as Data
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error?.localizedDescription)
            } else {
                if let dataResponse = data {
                    guard let json = try? JSONSerialization.jsonObject(with: dataResponse, options: []) as? NSDictionary else {
                        return
                    }
                    print(json)
                }
                
                let httpResponse = response as? HTTPURLResponse
                print(httpResponse)
            }
        })
        
        dataTask.resume()
    }
    
}
