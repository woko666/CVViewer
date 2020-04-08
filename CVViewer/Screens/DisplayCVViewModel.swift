//
//  DisplayCVViewModel.swift
//  CVViewer
//
//  Created by woko on 07/04/2020.
//  Copyright © 2020 Woko. All rights reserved.
//

import Foundation
import UIKit

class DisplayCVViewModel: TableViewModel {
    var cvService: CVService
    
    init(cvService: CVService) {
        self.cvService = cvService
    }
    
    var cvUpdated: (() -> Void)?
    
    var applicantName: String?
    var sections: [TableViewSectionModel] = []
    
    func loadCv() {
        updateLoading()
        cvService.loadCv(success: { [weak self] data in
            // simulate slow loading
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                self?.parcelCvData(data)
            }
        }, failure: { [weak self] in
            self?.updateFailure()
        })
    }
    
    func updateLoading() {
        sections = [TableSectionModel(cells: [LoadingCellModel()])]
        //applicantName = nil
        cvUpdated?()
    }
    
    func updateFailure() {
        sections = [TableSectionModel(cells: [ErrorCellModel()])]
        applicantName = nil
        cvUpdated?()
    }
    
    func parcelCvData(_ data: CVData) {
        sections = [
            TableSectionModel(title: "Basic Info", cells: [
                CVBasicCellModel(data.basic)
            ]),
            TableSectionModel(title: "Address", cells: [
                CVAddressCellModel(data.basic)
            ]),
            TableSectionModel(title: "Objective", cells: [
                CVTitleSubtitleCellModel(title: nil, subtitle: data.objective)
            ]),
            TableSectionModel(title: "Work Experience", cells: data.workExperience.map { CVWorkCellModel($0) }),
            TableSectionModel(title: "Technologies", cells: data.technologies.map { CVTitleSubtitleCellModel(title: $0.title, subtitle: $0.description) }),
            TableSectionModel(title: "Languages", cells: data.languages.map { CVTitleSubtitleCellModel(title: $0.title, subtitle: $0.level) }),
            TableSectionModel(title: "Education", cells: data.education.map { CVTitleSubtitleCellModel(title: $0.course + " at " + $0.institution, subtitle: $0.startDate + " - " + $0.endDate) })
        ]
        applicantName = data.basic.firstName + " " + data.basic.lastName
        cvUpdated?()
    }
}
