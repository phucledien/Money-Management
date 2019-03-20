//
//  AccountTableViewCell.swift
//  professional-app
//
//  Created by Phuc Le Dien on 3/20/19.
//  Copyright © 2019 phucld. All rights reserved.
//

import UIKit

class AccountTableViewCell: UITableViewCell {

    @IBOutlet fileprivate weak var nameLabel: UILabel!
    @IBOutlet fileprivate weak var totalLabel: UILabel!
    @IBOutlet fileprivate weak var bankLabel: UILabel!
    @IBOutlet fileprivate weak var numberLabel: UILabel!
    @IBOutlet fileprivate weak var coloredView: UIView!
    
    var viewModel: ViewModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            nameLabel.text = viewModel.name
            totalLabel.text = viewModel.total
            bankLabel.text = viewModel.bank
            numberLabel.text = viewModel.number
            coloredView.backgroundColor = viewModel.color
        }
    }

}

extension AccountTableViewCell {
    struct ViewModel {
        let name: String
        let total: String
        let bank: String
        let number: String
        let color: UIColor
        
        init(account: Account, index: Int) {
            name = account.name
            total = account.total.dollarsFormatting
            bank = account.bank
            number = account.number.accountNumberFormatting
            color = UIColor.color(for: index)
        }
    }
}
