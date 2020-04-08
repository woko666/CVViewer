//
//  CVAddressCell.swift
//  CVViewer
//
//  Created by woko on 07/04/2020.
//  Copyright © 2020 Woko. All rights reserved.
//

import Foundation
import UIKit

class CVAddressCell: UITableViewCell {
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
}

extension CVAddressCell: ConfigurableTableViewCell {
    func configure(_ model: TableViewCellModel) {
        guard let model = model as? CVAddressCellModel else { fatalError("CVAddressCell can only be configured with CVAddressCellModel.") }
        
        addressLabel.text = model.addressLine
        cityLabel.text = model.cityWithZip
        countryLabel.text = model.country
        
        // appearance
        addressLabel.setupRegularText()
        cityLabel.setupRegularText()
        countryLabel.setupRegularText()
        hideSeparator()
    }
}
