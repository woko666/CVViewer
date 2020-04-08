//
//  CVTitleSubtitleCellModel.swift
//  CVViewer
//
//  Created by woko on 07/04/2020.
//  Copyright © 2020 Woko. All rights reserved.
//

import Foundation
import Foundation

struct CVTitleSubtitleCellModel {
    var title: String?
    var subtitle: String?
}

extension CVTitleSubtitleCellModel: TableViewCellModel {
    static var identifier: String {
        return "CVTitleSubtitleCellModel"
    }
}
