//
//  CVAddressCellModel.swift
//  CVViewer
//
//  Created by woko on 07/04/2020.
//  Copyright © 2020 Woko. All rights reserved.
//

import Foundation

struct CVAddressCellModel {
    var addressLine: String
    var cityWithZip: String
    var country: String
}

extension CVAddressCellModel: TableViewCellModel {
    static var identifier: String {
        return "CVAddressCellModel"
    }
}

extension CVAddressCellModel {
    init(_ data: CVData.BasicData) {
        addressLine = data.address
        cityWithZip = data.zip + " " + data.city
        country = data.country
    }
}
