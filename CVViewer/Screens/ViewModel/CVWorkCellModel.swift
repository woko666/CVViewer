//
//  CVWorkCellModel.swift
//  CVViewer
//
//  Created by woko on 07/04/2020.
//  Copyright © 2020 Woko. All rights reserved.
//

import Foundation

struct CVWorkCellModel {
    var title: String
    var companyName: String
    var companyUrl: String
    var companyLogo: String
    var dates: String
    var details: String
}

extension CVWorkCellModel: TableViewCellModel {
    static var identifier: String {
        return "CVWorkCellModel"
    }
}

extension CVWorkCellModel {
    init(_ data: CVData.WorkExperience) {
        title = data.title
        companyName = data.company.name
        companyUrl = data.company.url
        companyLogo = data.company.logo
        
        let formatter = JsonTools.humanReadableFormatter
        dates = formatter.string(from: data.startDate) + " - "
        if let endDate = data.endDate {
            dates += formatter.string(from: endDate)
        } else {
            dates += "Present"
        }
        details = data.details
    }
}
