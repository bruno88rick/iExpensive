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
            List {
                //to do the filter way of Paul challange (Third challange)
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
    //to do the filter way of Paul challange (Third challange)
    
    /*func to find the object to delete basing on an offset passed in and an array, that is personal or bussiness array created */
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
    
    /*funcs to call delete method based on personal or business items*/
    func removePersonalItems(at offsets: IndexSet) {
        removeItems(at: offsets, in: expenses.personalItems)
        //removing item on primary array too
        //removeItems(at: offsets, in: expenses.items)
    }
    
    func removeBusinessItems(at offsets: IndexSet) {
        removeItems(at: offsets, in: expenses.businessItems)
        //removing item on primary array too
        //expenses.items.remove(atOffsets: offsets)
    }
}

#Preview {
    otherWayToFilterExpenses()
}
