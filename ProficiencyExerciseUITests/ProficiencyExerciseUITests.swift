//
//  ProficiencyExerciseUITests.swift
//  ProficiencyExerciseUITests
//
//  Created by Poonam More on 20/10/20.
//  Copyright © 2020 Poonam More. All rights reserved.
//

import XCTest

class ProficiencyExerciseUITests: XCTestCase {

    override func setUp() {
        continueAfterFailure = false
    }

    override func tearDown() {
    }

    func testExample() {
        let app = XCUIApplication()
        app.launch()

    }

    func testLaunchPerformance() {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
