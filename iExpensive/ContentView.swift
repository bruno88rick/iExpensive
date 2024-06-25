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
    //chalange 46 change:
    //@State private var showingAddExpense = false
    @State private var showingOtherWaytoFilter = false
    @State private var issueName = "iExpenses-Bruno"
    let appData = AppData()
    
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
                    .onDelete(perform: { offset in
                        expenses.items.remove(atOffsets: offset)
                    }) // *other way to remove items of a list using function instead of closures
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
            //.navigationBarTitleDisplayMode(.inline)
            
            .toolbar {
                Button ("Other way to Filter Expenses", systemImage: "list.bullet.clipboard"){
                    showingOtherWaytoFilter.toggle()
                }
                
                //Challange Day 46:
                /*Button ("Add Expenses", systemImage: "plus") {
                    showingAddExpense.toggle()
                }*/
                
                //Challange Day 46:
                NavigationLink{
                    AddView(expenses: expenses)
                }label: {
                    Label("Add Expenses", systemImage: "plus")
                }
            }
            //chalange 46 change:
            //.sheet(isPresented: $showingAddExpense) {
              //  AddView(expenses: expenses)
            //}
            .sheet(isPresented: $showingOtherWaytoFilter){
                otherWayToFilterExpenses()
            }
        }
        .padding()
        .ignoresSafeArea()
    }
    
    // *remove items of a list using function, instead of clousures:
    
    /*func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }*/

}

#Preview {
    ContentView()
}
