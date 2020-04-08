//
//  JsonTools.swift
//  CVViewer
//
//  Created by woko on 07/04/2020.
//  Copyright © 2020 Woko. All rights reserved.
//

import Foundation
import UIKit

class JsonTools {
    static var ymdFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        return dateFormatter
    }()
    
    static var humanReadableFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d. M. yyyy"
        return dateFormatter
    }()
    
    public static func decodeString<T: Decodable>(_ type: T.Type, from: Data, formatter: DateFormatter? = nil) -> T? {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(formatter ?? JsonTools.ymdFormatter)
        return try? decoder.decode(type, from: from)
    }
}
