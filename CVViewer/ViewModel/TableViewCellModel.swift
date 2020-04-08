//
//  TableViewCellModel.swift
//  CVViewer
//
//  Created by woko on 07/04/2020.
//  Copyright © 2020 Woko. All rights reserved.
//

import Foundation
import UIKit

protocol TableViewCellModel {
    static var identifier: String { get }
}

extension TableViewCellModel {
    var cellIdentifier: String {
        return Self.identifier
    }
}
