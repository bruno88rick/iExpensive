//
//  AddView.swift
//  iExpensive
//
//  Created by Bruno Oliveira on 10/02/24.
//

import SwiftUI

struct AddView: View {
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    
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
                
                TextField("Amount:", value: $amount, format: .currency(code: Locale.current.currency?.identifier ?? "BRL"))
                    .keyboardType(.decimalPad)
                
            }
            .navigationTitle("Add new Expense")
        }
    }
}

#Preview {
    AddView(expenses: Expenses())
}
