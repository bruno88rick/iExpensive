//
//  ExpensesItemUI.swift
//  iExpensive
//
//  Created by Bruno Oliveira on 13/02/24.
//

import SwiftUI

struct ExpensesItemUI: View {
    @State var item: ExpenseItem
    @State private var localCurrency = Locale.current.currency?.identifier ?? "BRL"
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline.bold())
                Text(item.type)
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            Spacer()
            Text(item.amount, format: .currency(code: localCurrency))
                .style(for: item)
        }
    }
}

#Preview {
    ExpensesItemUI(item: ExpenseItem(name: "Teste", type: "Personal", amount: 0.0))
}
