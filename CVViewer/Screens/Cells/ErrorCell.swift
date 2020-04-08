//
//  ErrorCell.swift
//  CVViewer
//
//  Created by woko on 07/04/2020.
//  Copyright © 2020 Woko. All rights reserved.
//

import Foundation
import UIKit

class ErrorCell: UITableViewCell {
     @IBOutlet weak var errorImage: UIImageView!
}

extension ErrorCell: ConfigurableTableViewCell {
    func configure(_ model: TableViewCellModel) {
        errorImage.tintColor = Config.color.title
        hideSeparator()
    }
}
