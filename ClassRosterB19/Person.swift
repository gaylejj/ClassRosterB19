//
//  Person.swift
//  ClassRosterB19
//
//  Created by Jeff Gayle on 7/21/14.
//  Copyright (c) 2014 Jeff Gayle. All rights reserved.
//

import Foundation
import UIKit

class Person {
    
//    John Clem
//    Brad Johnson
//    Jeff Gayle
//    Leonardo Lee
//    Mike Tirenin
//    Victor Adu
//    Kirby Shabaga
//    Collin Atherton
//    Alex Rice
//    Dan Hoang
    
    var firstName : String
    var lastName : String
    var image : UIImage?
    
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    func fullName() -> String {
        return self.firstName + self.lastName
    }
    
}
