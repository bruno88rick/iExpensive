//
//  View-ExpenseStyle.swift
//  iExpensive
//
//  Created by Bruno Oliveira on 13/02/24.
//

import SwiftUI

extension View {
    func style(for item: ExpenseItem) -> some View{
        if item.amount <= 10 {
            return self.foregroundStyle(.blue)
        } else if item.amount > 10 && item.amount < 100 {
            return self.foregroundStyle(.green)
        } else {
            return self.foregroundStyle(.red)
        }
    }
}
