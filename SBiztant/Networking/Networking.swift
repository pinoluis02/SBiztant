//
//  Networking.swift
//  SBiztant
//
//  Created by Luis Rufino Perez Romero on 12/2/17.
//

import Foundation

class Networking{
    
    static let sharedInstance = Networking()
    
    var cookies: [HTTPCookie]?
    
    public func get( request: URLRequest, completion: @escaping (_ success: Bool, _ object: AnyObject?) -> ()) {
        dataTask(request: request, method: "GET", completion: completion)
    }
    
    public func post( request: URLRequest, completion: @escaping (_ success: Bool, _ object: AnyObject?) -> ()) {
        dataTask(request: request, method: "POST", completion: completion)
    }
    
    public func put( request: URLRequest, completion: @escaping (_ success: Bool, _ object: AnyObject?) -> ()) {
        dataTask(request: request, method: "PUT", completion: completion)
    }
    
    public func delete( request: URLRequest, completion: @escaping (_ success: Bool, _ object: AnyObject?) -> ()) {
        dataTask(request: request, method: "DELETE", completion: completion)
    }
    
    private func dataTask( request: URLRequest, method: String, completion: @escaping (_ success: Bool, _ object: AnyObject?) -> ()) {
        var request = request
        request.httpMethod = method
        let session = URLSession.shared
        
        session.dataTask(with: request) { (data, response, error) -> Void in
            if let data = data {
                let json = try? JSONSerialization.jsonObject(with: data, options: [])
                if let response = response as? HTTPURLResponse, 200...299 ~= response.statusCode {
                    completion(true, json as AnyObject)
                } else {
                    completion(false, json as AnyObject)
                }
            }
            }.resume()
    }

    
    public func clientURLRequest(path: String, params: [String: AnyObject]? = nil, token: String? = nil) -> URLRequest {
        var request = URLRequest(url: URL(string: path)!, cachePolicy: .useProtocolCachePolicy,
                                 timeoutInterval: 10.0)
        if let params = params {
            do{
                let body = try JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)
                request.httpBody = body
            } catch let error {
                print(error)
            }
            
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue("application/json", forHTTPHeaderField: "Accept")
        }
        
        if let token = token {
            request.addValue("Bearer "+token, forHTTPHeaderField: "Authorization")
        }
        
        return request
    }
}

