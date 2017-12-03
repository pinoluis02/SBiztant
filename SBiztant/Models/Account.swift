//
//  Account.swift
//  TestingVisa
//
//  Created by Juan Mondragon on 12/2/17.
//  Copyright © 2017 Juan Mondragon. All rights reserved.
//

import Foundation

//MARK: Keys for parsing
public enum accountKeys: String {
    //BasicAccountDetail
    case keyBasicAccountDetail = "BasicAccountDetail"
    case keyBranchIdentifier = "BranchIdentifier"
    case keyRedactedAccountNumber = "RedactedAccountNumber"
    //-Balances
    case keyBalances = "Balances"
    case keyAccessibleBalanceAmount = "AccessibleBalanceAmount"
    case keyInvestmentBalanceAmount = "InvestmentBalanceAmount"
    case keyCreditAvailableBalanceAmount = "CreditAvailableBalanceAmount"
    case keyPayoffBalanceAmount = "PayoffBalanceAmount"
    case keyAvailableBalanceAmount = "AvailableBalanceAmount"
    case keyCurrentBalanceAmount = "CurrentBalanceAmount"
}

class AccountInfo {
    var balances: Balance
    var branchId: Int
    var redactedAccountNumber: String
    
    init(balances: Balance, branchId: Int, redactedAccountNumber: String) {
        (self.balances, self.branchId, self.redactedAccountNumber) = (balances, branchId, redactedAccountNumber)
    }
    
    
    
    //MARK: Convert JSON to AccountInfo object
    class func objectFrom(json: [String: AnyObject]) -> AccountInfo {
    
        let basicAccountDetail = json[accountKeys.keyBasicAccountDetail.rawValue] as? [String: AnyObject] ?? [:]
        
        let branchId = basicAccountDetail[accountKeys.keyBranchIdentifier.rawValue] as? String ?? "0"
        let redactedAccountNumber = basicAccountDetail[accountKeys.keyRedactedAccountNumber.rawValue] as? String ?? ""
        
        let balances = basicAccountDetail[accountKeys.keyBalances.rawValue] as? [String: AnyObject] ?? [:]
        let accessibleBalanceAmount = balances[accountKeys.keyAccessibleBalanceAmount.rawValue] as? String ?? "0"
        let availableBalanceAmount = balances[accountKeys.keyAvailableBalanceAmount.rawValue] as? String ?? "0"
        let creditAvailableBalanceAmount = balances[accountKeys.keyCreditAvailableBalanceAmount.rawValue] as? String ?? "0"
        let currentBalanceAmount = balances[accountKeys.keyCurrentBalanceAmount.rawValue] as? String ?? "0"
        let investmentBalanceAmount = balances[accountKeys.keyInvestmentBalanceAmount.rawValue] as? String ?? "0"
        let payoffBalanceAmount = balances[accountKeys.keyPayoffBalanceAmount.rawValue] as? String ?? "0"
        
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
