//
//  CVViewerUITests.swift
//  CVViewerUITests
//
//  Created by woko on 07/04/2020.
//  Copyright © 2020 Woko. All rights reserved.
//

import XCTest

class CVViewerUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCVLoaded() {
        let app = XCUIApplication()
        app.launch()

        var found = false
        for _ in 0..<10 {
            sleep(1)
            if XCUIApplication().tables.children(matching: .cell).count > 1 {
                found = true
                break
            }
        }
        
        if !found {
            XCTFail("CV cells were not loaded")
        }
    }
}
