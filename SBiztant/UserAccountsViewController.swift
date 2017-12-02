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
        
        UserAccounts().requestAccounts(for: "someUser")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


