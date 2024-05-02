//
//  Expenses.swift
//  iExpensive
//
//  Created by Bruno Oliveira on 10/02/24.
//

import Foundation

@Observable
class Expenses {
    
    /* The Codable protocol, which will allow us to archive all the existing expense items ready to be stored.
     UserDefaults, which will let us save and load that archived data.
     1- A custom initializer for the Expenses class, so that when we make an instance of it we load any saved data from UserDefaults
     2- A didSet property observer on the items property of Expenses, so that whenever an item gets added or removed we’ll write out changes. */
    
    /*
     
    We need to implement a custom initializer. That will:

     1- Attempt to read the “Items” key from UserDefaults.
     2- Create an instance of JSONDecoder, which is the counterpart of JSONEncoder that lets us go from JSON data to Swift objects.
     3- Ask the decoder to convert the data we received from UserDefaults into an array of ExpenseIt seem objects.
     4- If that worked, assign the resulting array to items and exit.
     5- Otherwise, set items to be an empty array
     
     */
    
    init() {
        //getting data from UserDafaults on standard for key "Items" and loading it on savedItems constant
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            //decoding Json Data to Swift data object and loading it on decodedIItems constant
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        items  = []
        
        /*
         It’s common to do a bit of a double take when you first see [ExpenseItem].self – what does the .self mean? Well, if we had just used [ExpenseItem], Swift would want to know what we meant – are we trying to make a copy of the class? Were we planning to reference a static property or method? Did we perhaps mean to create an instance of the class? To avoid confusion – to say that we mean we’re referring to the type itself, known as the type object – we write .self after it
         */
    }
    
    //creating a didSet property observer on the items property of Expenses
    
    var items = [ExpenseItem]() {
        didSet {
            //Using JSONEncoder().encode() means “create an encoder and use it to encode something,” all in one step, rather than creating the encoder first then using it later
            //try to encode swift Data (array items) to Json
            if let encoded = try? JSONEncoder().encode(items) {
                
                //storing encoded JSON data (from data Swift - Items array) to UserDefaults on standard on key Items
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    //to do the filter way of Paul challange (Third challange)
    
    /*Computated property to filter personal and business types into a var*/
    var personalItems: [ExpenseItem] {
        items.filter { $0.type == "Personal" }
    }
    
    var businessItems: [ExpenseItem] {
        items.filter {$0.type == "Business"}
    }
    
}
