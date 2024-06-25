//
//  ExpenseItem.swift
//  iExpensive
//
//  Created by Bruno Oliveira on 10/02/24.
//

import Foundation

struct ExpenseItem: Identifiable, Codable, Equatable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
