//
//  LoadingCell.swift
//  CVViewer
//
//  Created by woko on 07/04/2020.
//  Copyright © 2020 Woko. All rights reserved.
//

import Foundation
import UIKit

class LoadingCell: UITableViewCell {
    
}

extension LoadingCell: ConfigurableTableViewCell {
    func configure(_ model: TableViewCellModel) {
        hideSeparator()
    }
}
