//
//  TransactionsDataSource.swift
//  professional-app
//
//  Created by Phuc Le Dien on 3/20/19.
//  Copyright © 2019 phucld. All rights reserved.
//

import UIKit

class TransactionsDataSource: NSObject {
    var transactions: [Transaction]
    
    init(transactions: [Transaction]) {
        self.transactions = transactions
    }
}

extension TransactionsDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transactions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionCell", for: indexPath) as! TransactionTableViewCell
        let transaction = transactions[indexPath.row]
        cell.viewModel = TransactionTableViewCell.ViewModel(transaction: transaction)
        return cell
    }
}
