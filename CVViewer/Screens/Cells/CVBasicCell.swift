//
//  CVBasicCell.swift
//  CVViewer
//
//  Created by woko on 07/04/2020.
//  Copyright © 2020 Woko. All rights reserved.
//

import Foundation
import UIKit

class CVBasicCell: UITableViewCell {
    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var urlLabel: UILabel!
}

extension CVBasicCell: ConfigurableTableViewCell {
    func configure(_ model: TableViewCellModel) {
        guard let model = model as? CVBasicCellModel else { fatalError("CVBasicCell can only be configured with CVBasicCellModel.") }
        
        photoView.image = #imageLiteral(resourceName: "placeholderPortrait")
        photoView.loadImage(model.photo)
        nameLabel.text = model.name
        phoneLabel.text = model.phone
        urlLabel.text = model.url
        
        // appearance
        nameLabel.setupBoldText()
        phoneLabel.setupRegularText()
        urlLabel.setupRegularText()
        hideSeparator()
    }
}
