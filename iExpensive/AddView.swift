//
//  AddView.swift
//  iExpensive
//
//  Created by Bruno Oliveira on 10/02/24.
//

import SwiftData
import SwiftUI

struct AddView: View {
    @Environment(\.modelContext) var modelContext
    @Query var expenses: [ExpenseItem]
    
    @State private var type = "Personal"
    @State private var name = "New Expense"
    @State private var amount = 100.00
    
    @Environment(\.dismiss) var dismiss
    @State private var localCurrency = Locale.current.currency?.identifier ?? "BRL"
    
    let types = ["Business", "Personal"]
    
    var body: some View {
        NavigationStack {
            Form {
                Picker ("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                
                TextField("Amount:", value: $amount, format: .currency(code: localCurrency))
                    .keyboardType(.decimalPad)
                
            }
            .navigationTitle($name)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing){
                    Button("Save") {
                        let expense = ExpenseItem(name: name, type: type, amount: amount)
                        modelContext.insert(expense)
                        dismiss()
                    }
                }
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel", role: .cancel){
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    AddView()
}
