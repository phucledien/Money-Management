//
//  TransactionTableViewCell.swift
//  professional-app
//
//  Created by Phuc Le Dien on 3/20/19.
//  Copyright © 2019 phucld. All rights reserved.
//

import UIKit

class TransactionTableViewCell: UITableViewCell {
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    
    var viewModel: ViewModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            descriptionLabel.text = viewModel.description
            amountLabel.text = viewModel.amount
            amountLabel.textColor = viewModel.amountColor
            dateLabel.text = viewModel.date
        }
    }
}

extension TransactionTableViewCell {
    struct ViewModel {
        let description: String
        let date: String
        let amount: String
        let amountColor: UIColor
        
        init(transaction: Transaction) {
            description = transaction.description
            amount = transaction.amount.dollarsFormatting
            date = transaction.date.transactionFormtting
            amountColor = transaction.category == .income ? .darkLimeGreen : .slate
        }
    }
}
