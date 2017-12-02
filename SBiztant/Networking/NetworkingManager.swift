//
//  NetworkingManager.swift
//  SBiztant
//
//  Created by Luis Rufino Perez Romero on 12/2/17.
//

import Foundation

class NetworkingManager {
    
    static let sharedInstance = NetworkingManager()
    
    var token: String?
    let listEndpointURLString = "https://api119525live.gateway.akana.com"
    let transactionEndpointURLString = "https://api119622live.gateway.akana.com"
    let detailEndpointURLString = "https://api119521live.gateway.akana.com"
    let transferEndpointURLString = "https://api132269live.gateway.akana.com"
    
    
    //MARK: Get Accounts for single User
    func getAccounts(for user: String, completion: @escaping (_ success: Bool, _ message: String?, _ accountInfo: AccountInfo?) -> ()) {
        
        let parameters = ["LegalParticipantIdentifier": user] as [String : AnyObject]
        Networking.sharedInstance.post(request: Networking.sharedInstance.clientURLRequest(path: "\(listEndpointURLString)/user/accounts", params: parameters)) { (success, object) -> () in
        if success {
            if let object = object, let jsonArray = object["AccessibleAccountDetailList"] as? [[String: AnyObject]]{
                
                for item in jsonArray {
                    let parsedObject = AccountInfo.objectFrom(json: item)
                    
                    DispatchQueue.main.async {
                        completion(true, nil, parsedObject)
                    }
                }
            }else{
                DispatchQueue.main.async {
                    completion(false, nil, nil)
                }
            }
        } else {
            var message = "there was an error"
            if let object = object, let passedMessage = object["message"] as? String {
                message = passedMessage
            }
            DispatchQueue.main.async {
                completion(false, message, nil)
            }
        }
        }
    }
    
}

