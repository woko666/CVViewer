//
//  DisplayCVViewModelTests.swift
//  CVViewerTests
//
//  Created by woko on 07/04/2020.
//  Copyright © 2020 Woko. All rights reserved.
//

import Foundation
import XCTest
@testable import CV_Viewer

class DisplayCVViewModelTests: XCTestCase {
    var service: CVServiceMock!
    var vm: DisplayCVViewModel!
    
    override func setUp() {
        service = CVServiceMock()
        vm = DisplayCVViewModel(cvService: service)
    }

    func testLoadDataSuccess() {
        let expectation = XCTestExpectation(description: "Load CV data")
        vm.cvUpdated = {
            if self.vm.sections.count > 1 {
                expectation.fulfill()
            }
        }
        vm.loadCv()
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testLoadDataFail() {
        service.success = false
        let expectation = XCTestExpectation(description: "Load CV data")
        vm.cvUpdated = {
            if self.vm.sections.first?.cells.first is ErrorCellModel {
                expectation.fulfill()
            }
        }
        vm.loadCv()
        wait(for: [expectation], timeout: 10.0)
    }
}
