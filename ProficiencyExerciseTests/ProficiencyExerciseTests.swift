//
//  ProficiencyExerciseTests.swift
//  ProficiencyExerciseTests
//
//  Created by Poonam More on 20/10/20.
//  Copyright © 2020 Poonam More. All rights reserved.
//

import XCTest
@testable import ProficiencyExercise

class ProficiencyExerciseTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    func testFactsViewModel() {
        let expectation = self.expectation(
             description: "Fetch API Data")
           let viewModel = FactsViewModel()
           viewModel.factsTitle.bind {
             if $0.caseInsensitiveCompare("About Canada") == .orderedSame {
               expectation.fulfill()
             }
           }
           waitForExpectations(timeout: 8, handler: nil)
    }

}
