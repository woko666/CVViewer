//
//  DisplayCVViewControllerTests.swift
//  CVViewerTests
//
//  Created by woko on 07/04/2020.
//  Copyright © 2020 Woko. All rights reserved.
//

import Foundation
import XCTest
@testable import CV_Viewer

class DisplayCVViewControllerTests: XCTestCase {
    var service: CVServiceMock!
    var vc: DisplayCVViewController!
    
    override func setUp() {
        service = CVServiceMock()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        vc = storyboard.instantiateViewController(withIdentifier: "DisplayCVViewController") as? DisplayCVViewController
        vc.viewModel = DisplayCVViewModel(cvService: service)
    }

    func testLoadDataSuccess() {
        vc.initializeViews()
        let expectation = XCTestExpectation(description: "Load CV data")
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            XCTAssertTrue(self.vc.numberOfSections(in: self.vc.tableView) > 1, "Error loading data")
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testLoadDataFail() {
        service.success = false
        vc.initializeViews()
        
        let expectation = XCTestExpectation(description: "Load CV data")
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            XCTAssertTrue(self.vc.numberOfSections(in: self.vc.tableView) == 1, "Error loading data")
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }
}
