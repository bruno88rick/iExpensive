//
//  ContentView.swift
//  iExpensive
//
//  Created by Bruno Oliveira on 10/02/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var expenses = Expenses()
    
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationStack {
            List {
                //Becouse our ExpensesItem scruct conforme to Identifiable protocol we no longer need to tell ForEach which property to use for the identifier (\.name) – it knows there will be an id property and that it will be unique, because that’s the point of the Identifiable protocol
                ForEach(expenses.items) { item in
                    Text(item.name)
                }
                .onDelete(perform: { indexSet in
                    expenses.items.remove(atOffsets: indexSet)
                }) // *other way to remove items of a list using function instead of closures
            }
            .navigationTitle("iExpenses")
            .toolbar {
                Button ("Add Expenses", systemImage: "plus") {
                    showingAddExpense.toggle()
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
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
