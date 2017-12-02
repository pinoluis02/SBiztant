//
//  Transaction.swift
//  SBiztant
//
//  Created by Juan Mondragon on 12/2/17.
//

import Foundation

class Transaction {
    var transactionId: String
    var accountPrimaryIdentifier: Int
    var accountProductCode: String
    var postedDate: Date
    var postedAmount: Double
    var transactionReferenceNumber: String
    var debitCreditCode: String
    var effectiveDate: Date
    var shortDescription: String
    var transactionDescription: String
    var standardIndustryCode: String
    var transactionCode: String
    var transactionSource: String
    var transactionDateTime: Date
    var level3DataAvailSwitch: Bool
    
    init(transactionId: String,
         accountPrimaryIdentifier: Int,
         accountProductCode: String,
         postedDate: Date,
         postedAmount: Double,
         transactionReferenceNumber: String,
         debitCreditCode: String,
         effectiveDate: Date,
         shortDescription: String,
         transactionDescription: String,
         standardIndustryCode: String,
         transactionCode: String,
         transactionSource: String,
         transactionDateTime: Date,
         level3DataAvailSwitch: Bool) {
        
        self.transactionId = transactionId
        self.accountPrimaryIdentifier = accountPrimaryIdentifier
        self.accountProductCode = accountProductCode
        self.postedDate = postedDate
        self.postedAmount = postedAmount
        self.transactionReferenceNumber = transactionReferenceNumber
        self.debitCreditCode = debitCreditCode
        self.effectiveDate = effectiveDate
        self.shortDescription = shortDescription
        self.transactionDescription = transactionDescription
        self.standardIndustryCode = standardIndustryCode
        self.transactionCode = transactionCode
        self.transactionSource = transactionSource
        self.transactionDateTime = transactionDateTime
        self.level3DataAvailSwitch = level3DataAvailSwitch
    }
    
}
