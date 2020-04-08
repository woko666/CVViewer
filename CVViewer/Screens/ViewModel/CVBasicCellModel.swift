//
//  CVBasicCellModel.swift
//  CVViewer
//
//  Created by woko on 07/04/2020.
//  Copyright © 2020 Woko. All rights reserved.
//

import Foundation

struct CVBasicCellModel {
    var photo: String
    var name: String
    var phone: String
    var url: String?
}

extension CVBasicCellModel: TableViewCellModel {
    static var identifier: String {
        return "CVBasicCellModel"
    }
}

extension CVBasicCellModel {
    init(_ data: CVData.BasicData) {
        photo = data.photo
        name = data.firstName + " " + data.lastName
        phone = data.phone
        url = data.url
    }
}
