//
//  ViewControllerTests.swift
//  ClassRosterB19
//
//  Created by Jeff Gayle on 7/21/14.
//  Copyright (c) 2014 Jeff Gayle. All rights reserved.
//

import UIKit
import XCTest

class ViewControllerTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCreateArray() {
        var controller = ViewController()
        var roster = controller.createArray()
        XCTAssertNotNil(roster, "roster array could not be created")
        println(roster.count)
    }

}
