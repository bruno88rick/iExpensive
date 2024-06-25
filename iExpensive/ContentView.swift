//
//  ContentView.swift
//  iExpensive
//
//  Created by Bruno Oliveira on 10/02/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var expenses = Expenses()
    @State private var showingOtherWaytoFilter = false
    @State private var issueName = "iExpenses-Bruno"
    let appData = AppData()
    
    var body: some View {
        NavigationStack {
            List {
                Section ("Business Expenses") {
                    ForEach(expenses.items) { item in
                        if item.type == "Business" {
                            ExpensesItemUI(item: item)
                        }
                    }
                    .onDelete(perform: { offset in
                        expenses.items.remove(atOffsets: offset)
                    })
                }
                
                Section("Personal Expenses") {
                    ForEach(expenses.items) { item in
                        if item.type == "Personal" {
                            ExpensesItemUI(item: item)
                        }
                    }
                    .onDelete(perform: { offset in
                        expenses.items.remove(atOffsets: offset)
                    })
                }
                
                Section ("App Information") {
                    Text("Version: \(appData.releaseVersion) Type: \(appData.releaseType)")
                        .font(.caption)
                }
            }
            .navigationTitle($issueName)
            .toolbar {
                Button ("Other way to Filter Expenses", systemImage: "list.bullet.clipboard"){
                    showingOtherWaytoFilter.toggle()
                }
                NavigationLink{
                    AddView(expenses: expenses)
                }label: {
                    Label("Add Expenses", systemImage: "plus")
                }
            }
            .sheet(isPresented: $showingOtherWaytoFilter){
                otherWayToFilterExpenses()
            }
        }
        .padding()
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
