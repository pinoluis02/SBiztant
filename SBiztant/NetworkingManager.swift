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
    
    
}

