//
//  ExpenseItem.swift
//  iExpensive
//
//  Created by Bruno Oliveira on 10/02/24.
//

import Foundation

/*encode() method can only archive objects that conform to the Codable protocol. Remember, conforming to Codable is what asks the compiler to generate code for us able to handle archiving and unarchiving objects, and if we don’t add a conformance for that then our code won’t build.*/

////to do the filter way of Paul challange (Third challange): Equatable -> Asks swift to generate an equatable conformance does that, is this item here equal to items here. it check very property in orterh... like: Is this UUID equals to this UUID
struct ExpenseItem: Identifiable, Codable, Equatable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
