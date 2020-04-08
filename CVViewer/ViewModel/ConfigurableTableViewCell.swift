//
//  ConfigurableTableViewCell.swift
//  CVViewer
//
//  Created by woko on 07/04/2020.
//  Copyright © 2020 Woko. All rights reserved.
//

import Foundation
import UIKit

protocol ConfigurableTableViewCell {
    func configure(_ model: TableViewCellModel)
}
