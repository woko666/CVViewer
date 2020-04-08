//
//  CVServiceMock.swift
//  CVViewerTests
//
//  Created by woko on 07/04/2020.
//  Copyright © 2020 Woko. All rights reserved.
//

import Foundation
@testable import CV_Viewer

class CVServiceMock: CVService {
    var success: Bool = true
    
    func loadCv(success: @escaping (CVData) -> Void, failure: @escaping () -> Void) {
        if self.success, let cv = JsonTools.decodeString(CVData.self, from: TestAssets.getData("cv", ext: "json"), formatter: JsonTools.ymdFormatter) {
            success(cv)
        } else {
            failure()
        }
    }
}
