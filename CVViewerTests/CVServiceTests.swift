//
//  CVServiceTests.swift
//  CVViewerTests
//
//  Created by woko on 07/04/2020.
//  Copyright © 2020 Woko. All rights reserved.
//

import Foundation
import XCTest
@testable import CV_Viewer

class CVServiceTests: XCTestCase {
    var service: CVService!
    
    override func setUp() {
        service = CVServiceImpl()
    }

    func testLoadData() {
        let expectation = XCTestExpectation(description: "Load CV from backend")
        service.loadCv(success: { data in
            XCTAssertTrue(data.workExperience.count == 3, "Incorrect amount of work experience items")
            expectation.fulfill()
        }, failure: {
            XCTFail("Error downloading data from backend")
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: 10.0)
    }
}
