//
//  AccountsDataSource.swift
//  professional-app
//
//  Created by Phuc Le Dien on 3/20/19.
//  Copyright © 2019 phucld. All rights reserved.
//

import UIKit

class AccountsDataSource: NSObject {
    var accounts: [Account]
    
    init(accounts: [Account]) {
        self.accounts = accounts
    }
}

extension AccountsDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return accounts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AccountCell", for: indexPath) as! AccountTableViewCell
        let index = indexPath.row
        let account = accounts[index]
        cell.viewModel = AccountTableViewCell.ViewModel(account: account, index: index)
        return cell
    }
}
