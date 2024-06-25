//
//  otherWayToFilterExpenses.swift
//  iExpensive
//
//  Created by Bruno Oliveira on 13/02/24.
//

//to do the filter way of Paul challange (Third challange)

import SwiftUI

struct otherWayToFilterExpenses: View {
    @State private var expenses = Expenses()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            Form {
                ExpensesSectionPaulWayUI(title: "Business", expenses: expenses.businessItems, deleteItems: removeBusinessItems)
            
                ExpensesSectionPaulWayUI(title: "Personal", expenses: expenses.personalItems, deleteItems: removePersonalItems)
            }
            .navigationTitle("iExpenses-Paul Filter")
            .toolbar {
                Button("Dismiss", systemImage: "xmark.circle"){
                    dismiss()
                }
            }
        }
        .padding()
    }
    func removeItems(at offsets: IndexSet, in inputArray: [ExpenseItem]) {
        var objectsToDelete = IndexSet()
        
        for offset in offsets {
            let item = inputArray[offset]
            
            if let index = expenses.items.firstIndex(of: item) {
                objectsToDelete.insert(index)
            }
        }
        expenses.items.remove(atOffsets: objectsToDelete)
    }

    func removePersonalItems(at offsets: IndexSet) {
        removeItems(at: offsets, in: expenses.personalItems)
    }
    
    func removeBusinessItems(at offsets: IndexSet) {
        removeItems(at: offsets, in: expenses.businessItems)
    }
}

#Preview {
    otherWayToFilterExpenses()
}
