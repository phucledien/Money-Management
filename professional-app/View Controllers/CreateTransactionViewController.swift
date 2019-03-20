//
//  CreateTransactionViewController.swift
//  professional-app
//
//  Created by Phuc Le Dien on 3/18/19.
//  Copyright © 2019 phucld. All rights reserved.
//

import UIKit

protocol CreateTransactionViewControllerDelegate: class {
    func add(newTransaction: Transaction)
}

class CreateTransactionViewController: UIViewController {

    weak var delegate: CreateTransactionViewControllerDelegate?
    
    var newTransactionView: NewTransactionView {
        return view as! NewTransactionView
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "SaveTransactionSegue" else { return }
        
        guard let amount = newTransactionView.amount,
            let description = newTransactionView.transactionDescription,
            let category = newTransactionView.selectedCategory
            else { return }
        let transaction = Transaction(amount: amount, description: description, date: Date(), category: category)
        delegate?.add(newTransaction: transaction)
    }
    
}
