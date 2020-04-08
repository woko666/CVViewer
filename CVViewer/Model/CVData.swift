//
//  CVData.swift
//  CVViewer
//
//  Created by woko on 07/04/2020.
//  Copyright © 2020 Woko. All rights reserved.
//

import Foundation
import UIKit

struct CVData: Codable {
    var basic: BasicData
    var objective: String
    var workExperience: [WorkExperience]
    var technologies: [Technology]
    var languages: [Language]
    var education: [Education]
    
    struct BasicData: Codable {
        var photo: String
        var firstName: String
        var lastName: String
        var phone: String
        var url: String?
        var address: String
        var city: String
        var country: String
        var zip: String
    }

    struct WorkExperience: Codable {
        var title: String
        var company: WorkExperienceCompany
        var startDate: Date
        var endDate: Date?
        var details: String
    }

    struct WorkExperienceCompany: Codable {
        var name: String
        var url: String
        var logo: String
    }

    struct Technology: Codable {
        var title: String
        var description: String
    }

    struct Language: Codable {
        var title: String
        var level: String
    }
    
    struct Education: Codable {
        var course: String
        var institution: String
        var startDate: String
        var endDate: String
    }
}
