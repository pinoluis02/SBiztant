//
//  Helper.swift
//  SBiztant
//
//  Created by Luis Rufino Perez Romero on 12/2/17.
//

import Foundation


extension String {
    var decimalValue: Double {
        return Double(self) ?? 0.0
    }
    
    var intValue: Int {
        return Int(self) ?? 0
    }
}

extension Double {
    var stringValue: String {
        return String(format: "%g", self)
    }
}
