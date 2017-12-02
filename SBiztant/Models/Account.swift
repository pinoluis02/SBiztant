//
//  Account.swift
//  TestingVisa
//
//  Created by Juan Mondragon on 12/2/17.
//  Copyright © 2017 Juan Mondragon. All rights reserved.
//

import Foundation

class AccountInfo {
    var balances: Balance
    var branchId: Int
    var redactedAccountNumber: String
    
    init(balances: Balance, branchId: Int, redactedAccountNumber: String) {
        (self.balances, self.branchId, self.redactedAccountNumber) = (balances, branchId, redactedAccountNumber)
    }
    
}

struct Balance {
    
    let accessibleBalanceAmount: Double
    let availableBalanceAmount: Double
    let creditAvailableBalanceAmount: Double
    let currentBalanceAmount: Double
    let investmentBalanceAmount: Double
    let payoffBalanceAmount: Double
    
    init(accessibleBalanceAmount: Double,
         availableBalanceAmount: Double,
         creditAvailableBalanceAmount: Double,
         currentBalanceAmount: Double,
         investmentBalanceAmount: Double,
         payoffBalanceAmount: Double) {
        (self.accessibleBalanceAmount, self.availableBalanceAmount, self.creditAvailableBalanceAmount, self.currentBalanceAmount, self.investmentBalanceAmount, self.payoffBalanceAmount) = (accessibleBalanceAmount, availableBalanceAmount, creditAvailableBalanceAmount, currentBalanceAmount, investmentBalanceAmount, payoffBalanceAmount)
    }
}
