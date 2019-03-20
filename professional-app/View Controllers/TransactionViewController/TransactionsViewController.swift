//
//  TransactionsViewController.swift
//  professional-app
//
//  Created by Phuc Le Dien on 3/18/19.
//  Copyright © 2019 phucld. All rights reserved.
//

import UIKit

class TransactionsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    
    var account: Account!
    var stateController: StateController!
    
    private var dataSource: TransactionsDataSource!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        numberLabel.text = account.number.accountNumberFormatting
        navigationItem.title = account.name
    }
    
    override func viewWillAppear(_ animated: Bool) {
        totalLabel.text = account.total.dollarsFormatting
        super.viewWillAppear(animated)
        dataSource = TransactionsDataSource(transactions: account.transactions)
        tableView.dataSource = dataSource
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let navigationController = segue.destination as? UINavigationController,
            let createTransactionViewController = navigationController.viewControllers.first as? CreateTransactionViewController {
            createTransactionViewController.delegate = self
        }
    }
    
    @IBAction func cancelTransactionCreation(_ segue: UIStoryboardSegue) {}
    @IBAction func saveTransaction(_ segue: UIStoryboardSegue) {}
}

extension TransactionsViewController: CreateTransactionViewControllerDelegate {
    func add(newTransaction: Transaction) {
        account.transactions.append(newTransaction)
        stateController.update(account)
    }
}
