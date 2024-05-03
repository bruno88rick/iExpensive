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
    
    //Challange Day 46:
    @State private var name = "Expense Title"
    
    @State private var type = "Personal"
    @State private var amount = 0.0
    @State private var localCurrency = Locale.current.currency?.identifier ?? "BRL"
    
    var expenses: Expenses
    
    let types = ["Business", "Personal"]
    
    var body: some View {
        NavigationStack {
            Form {
                //Challange Day 46:
                //TextField("Enter a name for the Expense:", text: $name)
                
                Picker ("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                
                TextField("Amount:", value: $amount, format: .currency(code: localCurrency))
                    .keyboardType(.decimalPad)
                
            }
            //Challange Day 46:
            .navigationTitle($name)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden()
            .toolbar {
                //Challange Day 46:
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save", systemImage: "square.and.arrow.down.on.square.fill"){
                        let item = ExpenseItem(name: name, type: type, amount: amount)
                        expenses.items.append(item)
                        dismiss()
                        //calling dismiss() when we want the view to dismiss itself. This causes the showingAddExpense Boolean in ContentView to go back to false, and hides the AddView.
                    }
                }
                //Challange Day 46:
                ToolbarItem(placement: .cancellationAction) {
                    Button("Exit Without Saving", systemImage: "xmark.circle"){
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    AddView(expenses: Expenses())
}
