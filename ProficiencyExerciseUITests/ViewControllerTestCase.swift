//
//  ViewControllerTestCase.swift
//  ProficiencyExerciseUITests
//
//  Created by Poonam More on 22/10/20.
//  Copyright © 2020 Poonam More. All rights reserved.
//

import XCTest
@testable import ProficiencyExercise

class ViewControllerTestCase: XCTestCase {
    
    var viewControllerUnderTest: ViewController!


    override func setUp() {
        self.viewControllerUnderTest = ViewController()
        self.viewControllerUnderTest.beginAppearanceTransition(true, animated: false)
    }

    override func tearDown() {
        self.viewControllerUnderTest.endAppearanceTransition()

    }

    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testHasATableView() {
        XCTAssertNotNil(viewControllerUnderTest.factsTableView)
    }
    
    func testTableViewHasDataSource() {
        XCTAssertNotNil(viewControllerUnderTest.factsTableView.dataSource)
    }
    
    func testTableViewConformsToTableViewDataSourceProtocol() {
        XCTAssertTrue(viewControllerUnderTest.conforms(to: UITableViewDataSource.self))
        XCTAssertTrue(viewControllerUnderTest.responds(to: #selector(viewControllerUnderTest.tableView(_:numberOfRowsInSection:))))
        XCTAssertTrue(viewControllerUnderTest.responds(to: #selector(viewControllerUnderTest.tableView(_:cellForRowAt:))))
    }

    func testShowItemsFromNetwork() {
        
        let tableView = viewControllerUnderTest.factsTableView
        
        XCTAssertEqual(3, tableView.dataSource?.tableView(tableView, numberOfRowsInSection: 0))
        
        let indexPath = NSIndexPath(row: 0, section: 0)
        let cell = tableView.dataSource?.tableView(tableView, cellForRowAt: indexPath as IndexPath) as! FactsTableViewCell
        XCTAssertEqual("Beavers", cell.titleLabel.text)
    }
}
