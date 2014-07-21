//
//  PersonTests.swift
//  ClassRosterB19
//
//  Created by Jeff Gayle on 7/21/14.
//  Copyright (c) 2014 Jeff Gayle. All rights reserved.
//

import UIKit
import XCTest
// import ClassRosterB19 - Imports entire module

class PersonTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testPersonCreation() {
        var person = Person(firstName: "Richard", lastName: "Sherman")
        XCTAssertNotNil(person, "person can not be created")
    }
    
    func testFirstName() {
        var person = Person(firstName: "Russell", lastName: "Wilson")
        XCTAssertNotNil(person.firstName, "person's first name property could not be created")
    }
    
    func testPersonInit() {
        var person = Person(firstName: "Jeff", lastName: "Gayle")
        XCTAssertNotNil(person, "person could not be created")
    }
    
    func testFullName() {
        var first = "Doug"
        var last = "Baldwin"
        
        var person = Person(firstName: first, lastName: last)
        XCTAssertEqual(person.fullName(), first + last, "full name is not matching")
    }
    
    func testImage() {
        var person = Person(firstName: "Jeff", lastName: "Gayle")
        person.image = UIImage(named: "Husky Puppy.jpg")
        XCTAssertNotNil(person.image, "person's image could not be created")
    }

}
