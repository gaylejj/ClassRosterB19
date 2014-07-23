//
//  ViewController.swift
//  ClassRosterB19
//
//  Created by Jeff Gayle on 7/21/14.
//  Copyright (c) 2014 Jeff Gayle. All rights reserved.
//

import UIKit

//class ViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
//    
//    var people = Person.arrayFromPList()
//    @IBOutlet var tableview : UITableView?
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
//    
//    override func viewWillAppear(animated: Bool) {
//        tableview!.reloadData()
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//    
//    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
//        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as PersonTableViewCell
//    
//        var singlePerson : Person
//    
//        singlePerson = people[indexPath.row]
//    
//        cell.firstNameLabel.text = singlePerson.firstName
//        cell.lastNameLabel.text = singlePerson.lastName
//        cell.personImageView.image = singlePerson.image?
//        
//        cell.editing = true
//    
//        return cell
//    }
//    
//    func tableView(tableView: UITableView!,numberOfRowsInSection section: Int) -> Int {
//        return people.count
//    }
//    
//    func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!) {
//        if (editingStyle == UITableViewCellEditingStyle.Delete) {
//            people.removeAtIndex(indexPath.row)
//            tableview!.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
//        }
//    }
//    
//    func tableView(tableView: UITableView!, canEditRowAtIndexPath indexPath: NSIndexPath!) -> Bool
//    {
//        return true
//    }
//    
//    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
//        if segue.identifier == "ShowDetail" {
//            let destination = segue.destinationViewController as DetailViewController
//            let indexPath : NSIndexPath = tableview!.indexPathForSelectedRow()
//            
//            destination.person = people[indexPath.row]
//            tableview!.deselectRowAtIndexPath(indexPath, animated: true)
//        } else if segue.identifier == "AddPerson" {
//            let destination = segue.destinationViewController as DetailViewController
//            
//            var newPerson = Person(firstName: "", lastName: "")
//            newPerson.image = UIImage(named: "Husky Puppy.jpg")
//            people.append(newPerson)
//            destination.person = newPerson
//        }
//    }
//
//    
//}
//
