//
//  AddView.swift
//  iExpensive
//
//  Created by Bruno Oliveira on 10/02/24.
//

import SwiftUI

struct AddView: View {
    
    //creating an property wraper for this view to dismiss the view
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    @State private var localCurrency = Locale.current.currency?.identifier ?? "BRL"
    
    var expenses: Expenses
    
    let types = ["Business", "Personal"]
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Enter a name for the Expense:", text: $name)
                
                Picker ("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                
                TextField("Amount:", value: $amount, format: .currency(code: localCurrency))
                    .keyboardType(.decimalPad)
                
            }
            .navigationTitle("Add new Expense")
            .toolbar {
                Button("Save", systemImage: "square.and.arrow.down.on.square.fill"){
                    let item = ExpenseItem(name: name, type: type, amount: amount)
                    expenses.items.append(item)
                    dismiss()
                    //calling dismiss() when we want the view to dismiss itself. This causes the showingAddExpense Boolean in ContentView to go back to false, and hides the AddView.
                }
                Spacer()
                Button("Exit Withou Saving", systemImage: "xmark.circle"){
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    AddView(expenses: Expenses())
}
