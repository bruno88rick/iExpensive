//
//  ExpenseItem.swift
//  iExpensive
//
//  Created by Bruno Oliveira on 10/02/24.
//

import Foundation

/*encode() method can only archive objects that conform to the Codable protocol. Remember, conforming to Codable is what asks the compiler to generate code for us able to handle archiving and unarchiving objects, and if we don’t add a conformance for that then our code won’t build.*/

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
