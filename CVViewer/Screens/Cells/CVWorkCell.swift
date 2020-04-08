//
//  CVWorkCell.swift
//  CVViewer
//
//  Created by woko on 07/04/2020.
//  Copyright © 2020 Woko. All rights reserved.
//

import Foundation
import UIKit

class CVWorkCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var companyLogo: UIImageView!
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var companyUrlLabel: UILabel!
    @IBOutlet weak var datesLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
}

extension CVWorkCell: ConfigurableTableViewCell {
    func configure(_ model: TableViewCellModel) {
        guard let model = model as? CVWorkCellModel else { fatalError("CVWorkCell can only be configured with CVWorkCellModel.") }
        
        titleLabel.text = model.title
        companyLogo.image = #imageLiteral(resourceName: "placeholderImage")
        companyLogo.loadImage(model.companyLogo)
        companyNameLabel.text = model.companyName
        companyUrlLabel.text = model.companyUrl
        datesLabel.text = model.dates
        detailsLabel.text = model.details
        
        // appearance
        titleLabel.setupBoldText()
        companyNameLabel.setupRegularText()
        companyUrlLabel.setupRegularText()
        datesLabel.setupRegularText()
        detailsLabel.setupRegularText()
    }
}
