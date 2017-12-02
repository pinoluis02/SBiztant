//
//  Account.swift
//  TestingVisa
//
//  Created by Juan Mondragon on 12/2/17.
//  Copyright © 2017 Juan Mondragon. All rights reserved.
//

import Foundation

//MARK: Keys for parsing
//BasicAccountDetail
let keyBasicAccountDetail = "BasicAccountDetail"
let keyBranchIdentifier = "BranchIdentifier"
let keyRedactedAccountNumber = "RedactedAccountNumber"
//-Balances
let keyBalances = "Balances"
let keyAccessibleBalanceAmount = "AccessibleBalanceAmount"
let keyInvestmentBalanceAmount = "InvestmentBalanceAmount"
let keyCreditAvailableBalanceAmount = "CreditAvailableBalanceAmount"
let keyPayoffBalanceAmount = "PayoffBalanceAmount"
let keyAvailableBalanceAmount = "AvailableBalanceAmount"
let keyCurrentBalanceAmount = "CurrentBalanceAmount"

class AccountInfo {
    var balances: Balance
    var branchId: Int
    var redactedAccountNumber: String
    
    init(balances: Balance, branchId: Int, redactedAccountNumber: String) {
        (self.balances, self.branchId, self.redactedAccountNumber) = (balances, branchId, redactedAccountNumber)
    }
    
    
    
    //MARK: Convert JSON to AccountInfo object
    class func objectFrom(json: [String: AnyObject]) -> AccountInfo {
    
        let basicAccountDetail = json[keyBasicAccountDetail] as? [String: AnyObject] ?? [:]
        
        let branchId = basicAccountDetail[keyBranchIdentifier] as? String ?? "0"
        let redactedAccountNumber = basicAccountDetail[keyRedactedAccountNumber] as? String ?? ""
        
        let balances = basicAccountDetail[keyBalances] as? [String: AnyObject] ?? [:]
        let accessibleBalanceAmount = balances[keyAccessibleBalanceAmount] as? String ?? "0"
        let availableBalanceAmount = balances[keyAvailableBalanceAmount] as? String ?? "0"
        let creditAvailableBalanceAmount = balances[keyCreditAvailableBalanceAmount] as? String ?? "0"
        let currentBalanceAmount = balances[keyCurrentBalanceAmount] as? String ?? "0"
        let investmentBalanceAmount = balances[keyInvestmentBalanceAmount] as? String ?? "0"
        let payoffBalanceAmount = balances[keyPayoffBalanceAmount] as? String ?? "0"
        
        let balance = Balance(accessibleBalanceAmount: accessibleBalanceAmount.decimalValue, availableBalanceAmount: availableBalanceAmount.decimalValue, creditAvailableBalanceAmount: creditAvailableBalanceAmount.decimalValue, currentBalanceAmount: currentBalanceAmount.decimalValue, investmentBalanceAmount: investmentBalanceAmount.decimalValue, payoffBalanceAmount: payoffBalanceAmount.decimalValue)
        
        return AccountInfo(balances: balance, branchId: branchId.intValue, redactedAccountNumber: redactedAccountNumber)
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
