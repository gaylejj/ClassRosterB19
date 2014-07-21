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
    
    var firstName : String
    var lastName : String
    var image : UIImage?
    
//    var rosterArray = [Person]()
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    func fullName() -> String {
        return self.firstName + self.lastName
    }
    
    func assignImage() -> UIImage {
        self.image = UIImage(named: "Husky Puppy.jpg")
        return self.image!
    }
    
}
