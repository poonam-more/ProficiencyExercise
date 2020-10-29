//
//  FetchDataTest.swift
//  ProficiencyExerciseTests
//
//  Created by Poonam More on 22/10/20.
//  Copyright © 2020 Poonam More. All rights reserved.
//

import XCTest

class FetchDataTest: XCTestCase {

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
    func testFetchData() {
        let exp = expectation(description: "server fetch")
        Utils.apiWebSerciceCall(completionHandler: { (data, title) in
            XCTAssertTrue(data!.count > 0, "Data shouldn't be empty")
            exp.fulfill()
        })
        waitForExpectations(timeout: 15, handler: { (errors) in
            print(errors?.localizedDescription as Any)
        })
    }

}
