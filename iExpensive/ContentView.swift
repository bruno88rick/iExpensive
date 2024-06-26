//
//  ContentView.swift
//  iExpensive
//
//  Created by Bruno Oliveira on 10/02/24.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    
    @Environment(\.modelContext) var modelContext
    @Query var expense: [ExpenseItem]
    @State private var showingOtherWaytoFilter = false
    @State private var showingAddView = false
    @State private var showingDeleteAllAlert = false
    @State private var filterBy = "All Expenses"
    @State private var issueName = "iExpenses-Bruno"
    let appData = AppData()
    
    @State private var sortOrder = [
        SortDescriptor(\ExpenseItem.name),
        SortDescriptor(\ExpenseItem.type),
    ]
    
    var body: some View {
        NavigationStack {
            ExpensesItemUI(typeToFilter: filterBy, sortOrder: sortOrder)
            Section() {
                Text("Version: \(appData.releaseVersion) Type: \(appData.releaseType)")
                    .font(.caption)
            }
            .navigationTitle($issueName)
            .alert("Delete All?", isPresented: $showingDeleteAllAlert) {
                Button("Yes, Delete All", role: .destructive) {
                    deleteAll()
                }
                Button("No! My Mistake", role: .cancel) { }
            } message: {
                Text("""
                     Do you really want to delete all Expenses?
                     
                     Obs.: To delete just one, swipe to left on the list.
                     """)
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Delete all", systemImage: "trash") {
                        showingDeleteAllAlert.toggle()
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Menu("Sort", systemImage: "arrow.up.arrow.down") {
                        Picker("Sort By", selection: $sortOrder) {
                            Text("Name: (A-Z)")
                                .tag([
                                    SortDescriptor(\ExpenseItem.name),
                                    SortDescriptor(\ExpenseItem.amount)
                                ])
                            Text("Name: (Z-A)")
                                .tag([
                                    SortDescriptor(\ExpenseItem.name, order: .reverse),
                                    SortDescriptor(\ExpenseItem.amount)
                                ])
                            Text("Amount: Most Expensive First")
                                .tag([
                                    SortDescriptor(\ExpenseItem.amount, order: .reverse),
                                    SortDescriptor(\ExpenseItem.name)
                                ])
                            Text("Amount: More Cheaper first")
                                .tag([
                                    SortDescriptor(\ExpenseItem.amount),
                                    SortDescriptor(\ExpenseItem.name)
                                ])
                        }
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Menu("Filter", systemImage: "line.3.horizontal.decrease.circle") {
                        Picker("Filter By", selection: $filterBy) {
                            Text("Show All Expenses")
                                .tag("All Expenses")
                            Divider()
                            ForEach(AddView.types, id: \.self) { type in
                                Text("Show Only \(type)")
                                    .tag(type)
                            }
                        }
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add Expenses", systemImage: "plus") {
                        showingAddView.toggle()
                    }
                }
            }
            .sheet(isPresented: $showingAddView){
                AddView()
            }
            .padding()
            .ignoresSafeArea()
        }
    }

    func deleteAll() {
        try? modelContext.delete(model: ExpenseItem.self)
    }
    
}

#Preview {
    ContentView()
        .modelContainer(for: ExpenseItem.self)
}
