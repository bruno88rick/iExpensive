//
//  iExpensiveApp.swift
//  iExpensive
//
//  Created by Bruno Oliveira on 10/02/24.
//

import SwiftUI

@main
struct iExpensiveApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: ExpenseItem.self)
    }
}
