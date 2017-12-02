//
//  UserAccounts.swift
//  TestingVisa
//
//  Created by Juan Mondragon on 12/2/17.
//  Copyright © 2017 Juan Mondragon. All rights reserved.
//

import UIKit

class UserAccountsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        UserAccounts().r equestAccounts(for: "someUser")
        
        let id = "913995730031830909"
        getAccounts(for: id)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //getAccounts Details for user
    func getAccounts(for id: String){
        NetworkingManager.sharedInstance.getAccounts(for: id) { (success, message, accountInfo) in
            if success{
                print("printing accountInfo.....")
                print(accountInfo)
            } else if let message = message{
                print(message)
            }
        }
    }
}


