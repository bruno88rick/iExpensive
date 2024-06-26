//
//  ExpenseItem.swift
//  iExpensive
//
//  Created by Bruno Oliveira on 10/02/24.
//

import SwiftData
import Foundation

@Model
class ExpenseItem: Identifiable {
    var id = UUID()
    var name: String
    var type: String
    var amount: Double
    
    init(name: String, type: String, amount: Double) {
        self.name = name
        self.type = type
        self.amount = amount
    }
    
}
