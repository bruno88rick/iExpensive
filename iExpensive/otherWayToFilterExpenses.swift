//
//  otherWayToFilterExpenses.swift
//  iExpensive
//
//  Created by Bruno Oliveira on 13/02/24.
//

//to do the filter way of Paul challange (Third challange)

import SwiftUI

struct otherWayToFilterExpenses: View {

    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            Form {
                
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
}

#Preview {
    otherWayToFilterExpenses()
}
