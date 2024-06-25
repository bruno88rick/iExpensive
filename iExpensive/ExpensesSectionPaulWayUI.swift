//
//  ExpensesSectionPaulWayUI.swift
//  iExpensive
//
//  Created by Bruno Oliveira on 13/02/24.
//

import SwiftUI

struct ExpensesSectionPaulWayUI: View {

    let title: String
    let expenses: [ExpenseItem]
    let deleteItems: (IndexSet) -> Void
    
    let localCurrency = Locale.current.currency?.identifier ?? "BRL"
    
    var body: some View {
        Section(title) {
            ForEach(expenses) { item in
                HStack {
                    VStack (alignment: .leading) {
                        Text(item.name)
                            .font(.headline)
                        
                        Text(item.type)
                    }
                    Spacer()
                    
                    Text(item.amount, format: .currency(code: localCurrency))
                        .style(for: item)
                }
            }
            .onDelete(perform: deleteItems)
        }
    }
}

#Preview {
    ExpensesSectionPaulWayUI(title: "Personal", expenses: []) { _ in
        
    }
}
