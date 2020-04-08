//
//  CVTitleSubtitleCell.swift
//  CVViewer
//
//  Created by woko on 07/04/2020.
//  Copyright © 2020 Woko. All rights reserved.
//

import Foundation
import UIKit

class CVTitleSubtitleCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
}

extension CVTitleSubtitleCell: ConfigurableTableViewCell {
    func configure(_ model: TableViewCellModel) {
        guard let model = model as? CVTitleSubtitleCellModel else { fatalError("CVTitleSubtitleCell can only be configured with CVTitleSubtitleCellModel.") }
        
        titleLabel.text = model.title
        subtitleLabel.text = model.subtitle
        
        // appearance
        titleLabel.setupBoldText()
        subtitleLabel.setupRegularText()
    }
}
