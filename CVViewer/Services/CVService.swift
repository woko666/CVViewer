//
//  CVService.swift
//  CVViewer
//
//  Created by woko on 07/04/2020.
//  Copyright © 2020 Woko. All rights reserved.
//

import Foundation

protocol CVService {
    func loadCv(success: @escaping (CVData) -> Void, failure: @escaping () -> Void)
}
