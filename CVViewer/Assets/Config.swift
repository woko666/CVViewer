//
//  AppConstants.swift
//  CVViewer
//
//  Created by woko on 07/04/2020.
//  Copyright © 2020 Woko. All rights reserved.
//

import Foundation
import UIKit

class Config {
    static let cvUrl = URL(string: "https://gist.githubusercontent.com/woko666/90ab1ac9b5893c57dbb1c2e665047209/raw/b8bbd35b812f843cc4420e8cd612432d8146b41e/cv.json")!
    static let appName = "CV Viewer"
    
    static let color = ConfigColors()
    static let font = ConfigFonts()
}

class ConfigColors {
    let title = UIColor.from(hex: "550000")
    let text = UIColor.from(hex: "333333")
}

class ConfigFonts {
    let regularText = UIFont.systemFont(ofSize: 16)
    let regularBoldText = UIFont.systemFont(ofSize: 16, weight: .bold)
}

extension UILabel {
    func setupRegularText() {
        font = Config.font.regularText
        textColor = Config.color.text
    }
    
    func setupBoldText() {
        font = Config.font.regularBoldText
        textColor = Config.color.text
    }
}
