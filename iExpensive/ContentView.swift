//
//  ContentView.swift
//  iExpensive
//
//  Created by Bruno Oliveira on 10/02/24.
//

import SwiftUI

/*TO Store and load data from user defaults we need:
 
 The Codable protocolThe Codable protocol, which will allow us to archive all the existing expense items ready to be stored.
 
 UserDefaults, which will let us save and load that archived data.
 
 A custom initializer for the Expenses class, so that when we make an instance of it we load any saved data from UserDefaults
 
 A didSet property observer on the items property of Expenses, so that whenever an item gets added or removed we’ll write out changes., which will allow us to archive all the existing expense items ready to be stored.
 
 */

struct ContentView: View {
    
    @State private var expenses = Expenses()
    @State private var showingAddExpense = false
    @State private var showingOtherWaytoFilter = false
    
    var body: some View {
        NavigationStack {
            List {
                Section ("Business Expenses") {
                    //Becouse our ExpensesItem scruct conforme to Identifiable protocol we no longer need to tell ForEach which property to use for the identifier (\.name) – it knows there will be an id property and that it will be unique, because that’s the point of the Identifiable protocol
                    ForEach(expenses.items) { item in
                        if item.type == "Business" {
                            ExpensesItemUI(item: item)
                        }
                    }
                    .onDelete(perform: { indexSet in
                        expenses.items.remove(atOffsets: indexSet)
                    }) // *other way to remove items of a list using function instead of closures
                }
                
                Section("Personal Expenses") {
                    ForEach(expenses.items) { item in
                        if item.type == "Personal" {
                            ExpensesItemUI(item: item)
                        }
                    }
                    .onDelete(perform: { indexSet in
                        expenses.items.remove(atOffsets: indexSet)
                    })
                }
                
            }
            .navigationTitle("iExpenses - Bruno")
            .toolbar {
                Button ("Other way to Filter Expenses", systemImage: "list.bullet.clipboard"){
                    showingOtherWaytoFilter.toggle()
                }
                
                Button ("Add Expenses", systemImage: "plus") {
                    showingAddExpense.toggle()
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
            .sheet(isPresented: $showingOtherWaytoFilter){
                otherWayToFilterExpenses()
            }
        }
        .padding()
    }
    
    // *remove items of a list using function, instead of clousures:
    
    /*func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }*/

}

#Preview {
    ContentView()
}
