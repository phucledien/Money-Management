//
//  AccountsViewController.swift
//  professional-app
//
//  Created by Phuc Le Dien on 3/18/19.
//  Copyright © 2019 phucld. All rights reserved.
//

import UIKit

class AccountsViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    var stateController: StateController!
    
    private var dataSource: AccountsDataSource!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        dataSource = AccountsDataSource(accounts: stateController.accounts)
        tableView.dataSource = dataSource
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "CreateAccountSegue":
            if let navigationController = segue.destination as? UINavigationController,
                let createAccountViewController = navigationController.viewControllers.first as? CreateAccountViewController {
                createAccountViewController.stateController = stateController
            }
        case "TransactionsSegue":
            if let transactionViewController = segue.destination as? TransactionsViewController,
                let selectedIndex = tableView.indexPathForSelectedRow?.row {
                let account = dataSource.accounts[selectedIndex]
                transactionViewController.account = account
                transactionViewController.stateController = stateController
            }
        default:
            break
        }
    }
    
    @IBAction func cancelAccountCreation(_ segue: UIStoryboardSegue) {}
    @IBAction func saveAccount(_ segue: UIStoryboardSegue) {}
}
