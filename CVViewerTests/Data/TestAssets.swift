//
//  TestAssets.swift
//  CVViewerTests
//
//  Created by woko on 07/04/2020.
//  Copyright © 2020 Woko. All rights reserved.
//

import Foundation
import UIKit

class TestAssets {
    static func getText(_ name: String, ext: String) -> String {
        return String(data: getData(name, ext: ext), encoding: .utf8)!
    }
    
    static func getData(_ name: String, ext: String) -> Data {
        let bundle = Bundle(for: TestAssets.self)
        let path = bundle.path(forResource: name, ofType: ext)!
        return NSData(contentsOfFile: path)! as Data
    }
}
