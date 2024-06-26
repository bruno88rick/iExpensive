//
//  ExpensesSectionPaulWayUI.swift
//  iExpensive
//
//  Created by Bruno Oliveira on 13/02/24.
//

import SwiftUI

struct ExpensesSectionPaulWayUI: View {

    let title: String
    
    let localCurrency = Locale.current.currency?.identifier ?? "BRL"
    
    var body: some View {
        Section(title) {
            
        }
    }
}

#Preview {
    ExpensesSectionPaulWayUI(title: "Filter")
}
