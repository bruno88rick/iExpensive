//
//  ExpensesItemUI.swift
//  iExpensive
//
//  Created by Bruno Oliveira on 13/02/24.
//

import SwiftData
import SwiftUI

struct ExpensesItemUI: View {
    
    @Environment(\.modelContext) var modelContext
    @Query var expenses: [ExpenseItem]
    
    @State private var localCurrency = Locale.current.currency?.identifier ?? "BRL"
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(expenses) { expense in
                    NavigationLink(value: expense) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(expense.name)
                                    .font(.headline.bold())
                                Text(expense.type)
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }
                            Spacer()
                            Text(expense.amount, format: .currency(code: localCurrency))
                                .style(for: expense)
                        }
                        .accessibilityElement()
                        .accessibilityLabel("\(expense.name), \(expense.amount.formatted(.currency(code: localCurrency)))")
                        .accessibilityHint("\(expense.type)")
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .navigationDestination(for: ExpenseItem.self) { expense in
                ExpenseDetailView(expense: expense)
            }
        }
    }
    
    func deleteItems(at offsets: IndexSet) {
        for offset in offsets {
            let item = expenses[offset]
            modelContext.delete(item)
        }
    }
    
    init(typeToFilter: String, sortOrder: [SortDescriptor<ExpenseItem>]) {
        _expenses = Query(filter: #Predicate<ExpenseItem> { expense in
            expense.type == typeToFilter || typeToFilter == "All Expenses"
        }, sort: sortOrder)
    }
}

#Preview {
    ExpensesItemUI(typeToFilter: "Personal", sortOrder: [SortDescriptor(\ExpenseItem.name), SortDescriptor(\ExpenseItem.type)])
        .modelContainer(for: ExpenseItem.self)
}
