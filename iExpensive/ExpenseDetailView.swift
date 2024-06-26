//
//  ExpenseDetailView.swift
//  iExpensive
//
//  Created by Bruno Oliveira on 25/06/24.
//

import SwiftUI

struct ExpenseDetailView: View {
    @State private var localCurrency = Locale.current.currency?.identifier ?? "BRL"
    let expense: ExpenseItem
    
    var body: some View {
        Form {
            Section() {
                HStack {
                    Text("Amount:")
                    Spacer()
                    Text(expense.amount, format: .currency(code: localCurrency))
                        .style(for: expense)
                        .font(.headline)
                }
                HStack {
                    Text("Expense Type:")
                    Spacer()
                    Text(expense.type)
                        .font(.headline)
                }
            }
        }
        .navigationTitle(expense.name)
    }
}

#Preview {
    ExpenseDetailView(expense: ExpenseItem(name: "Teste", type: "Personal", amount: 100.00))
}
