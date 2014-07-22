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
        var roster = Person.arrayFromPList()
        XCTAssertNotNil(roster, "roster array could not be created")
//        for i in 0..<roster.count {
            println(String(roster.count) + " Objects in the array")
//        }
    }

}
