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
    
    var twitterHandle : String?
    var githubHandle : String?
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    // MARK: .plist load
    
    class func arrayFromPList() -> Array<Person> {
        //        var plist = NSArray(contentsOfFile: NSBundle.mainBundle().pathForResource("Class Roster", ofType: "plist"))
        
        var roster = Array<Person>()
        
        let path = NSBundle.mainBundle().pathForResource("Class Roster", ofType: "plist")
        
        let plistArray = NSArray(contentsOfFile: path)
        
        for obj in plistArray {
            if let person = obj as? Dictionary<String, String> {
                let firstName = person["firstName"] as String
                let lastName = person["lastName"] as String
                roster.append(Person(firstName: firstName, lastName: lastName))
            }
        }
        
        return roster
    }
    
    func fullName() -> String {
        return self.firstName + self.lastName
    }
    
    func assignImage() -> UIImage {
        self.image = UIImage(named: "Husky Puppy.jpg")
        return self.image!
    }
    
}
