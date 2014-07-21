//
//  ViewController.swift
//  ClassRosterB19
//
//  Created by Jeff Gayle on 7/21/14.
//  Copyright (c) 2014 Jeff Gayle. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    override func viewDidLoad() {
        super.viewDidLoad()
//        createArray()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var rosterArray = [Person]()
    
    let clem = Person(firstName: "John", lastName: "Clem")
    let johnson = Person(firstName: "Brad", lastName: "Johnson")
    let gayle = Person(firstName: "Jeff", lastName: "Gayle")
    let lee = Person(firstName: "Leonardo", lastName: "Lee")
    let tirenin = Person(firstName: "Mike", lastName: "Tirenin")
    let adu = Person(firstName: "Victor", lastName: "Adu")
    let shabaga = Person(firstName: "Kirby", lastName: "Shabaga")
    let atherton = Person(firstName: "Collin", lastName: "Atherton")
    let rice = Person(firstName: "Alex", lastName: "Rice")
    let hoang = Person (firstName: "Dan", lastName: "Hoang")
    
//    func createArray() -> Array<Person> {
//
//        rosterArray.append(clem)
//        rosterArray.append(johnson)
//        rosterArray.append(gayle)
//        rosterArray.append(lee)
//        rosterArray.append(tirenin)
//        rosterArray.append(adu)
//        rosterArray.append(shabaga)
//        rosterArray.append(atherton)
//        rosterArray.append(rice)
//        rosterArray.append(hoang)
//        
//        return rosterArray
//    }
    

    func arrayFromPList() -> Array<Person> {
        var plist = NSArray(contentsOfFile: NSBundle.mainBundle().pathForResource("Class Roster", ofType: ".plist"))
        rosterArray = plist as Array<Person>
        return rosterArray
    }
    
    
    
//    func sortArray(Array<T>) -> Array<T> {
//        
//    }
    
}

