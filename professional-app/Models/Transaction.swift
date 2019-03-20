//
//  Transaction.swift
//  professional-app
//
//  Created by Phuc Le Dien on 3/18/19.
//  Copyright © 2019 phucld. All rights reserved.
//

import Foundation

enum TransactionCategory: String {
    case income
    case groceries
    case utilities
    case home
    case transport
    case fun
}

struct Transaction {
    let amount: Float // In a real app that deals with money you should not use floating point numbers!
    let description: String
    let date: Date
    let category: TransactionCategory
}


extension Transaction {
    var plistRepresentation: [String: AnyObject] {
        return [
            "amount": amount as AnyObject,
            "description": description as AnyObject,
            "date": date as AnyObject,
            "category": category.rawValue as AnyObject
        ]
    }
    
    init(plist: [String: AnyObject]) {
        amount = plist["amount"] as! Float
        description = plist["description"] as! String
        date = plist["data"] as! Date
        category = TransactionCategory(rawValue: plist["category"] as! String)!
    }
}
