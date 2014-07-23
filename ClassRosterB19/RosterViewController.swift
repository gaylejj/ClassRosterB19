//
//  PersonDetailViewController.swift
//  ClassRosterB19
//
//  Created by Jeff Gayle on 7/22/14.
//  Copyright (c) 2014 Jeff Gayle. All rights reserved.
//

import UIKit

class RosterViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //MARK: Variables/Outlets
    var people = Person.arrayFromPList()
    @IBOutlet var tableview: UITableView?
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableview!.dataSource = self
        self.tableview!.delegate = self
        self.title = "Roster"
        self.navigationController.navigationItem.title = "Roster"
        
        let addPerson = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: "addPersonAction")
        
        self.navigationItem.rightBarButtonItem = addPerson
        
    }
    
    override func viewWillAppear(animated: Bool) {
        tableview!.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Tableview Delegates
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as PersonTableViewCell
        
        var singlePerson : Person
        
        singlePerson = people[indexPath.row]
        
        cell.firstNameLabel.text = singlePerson.firstName
        cell.lastNameLabel.text = singlePerson.lastName
        cell.personImageView.image = singlePerson.image?
        
        if singlePerson.image? == nil {
            cell.personImageView.hidden = true
        } else {
            cell.personImageView.hidden = false
            cell.personImageView.layer.cornerRadius = 0.5 * cell.personImageView.frame.width
            cell.personImageView.layer.masksToBounds = true
            cell.personImageView.layer.borderColor = UIColor.blackColor().CGColor
            cell.personImageView.layer.borderWidth = 2.0
        }
        
        cell.twitterHandle.text = singlePerson.twitterHandle?
        cell.githubHandle.text = singlePerson.githubHandle?
        
        return cell
    }
    
    func tableView(tableView: UITableView!,numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
    
    func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            people.removeAtIndex(indexPath.row)
            tableview!.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
        }
    }
    
    func tableView(tableView: UITableView!, canEditRowAtIndexPath indexPath: NSIndexPath!) -> Bool
    {
        return true
    }
    
    //MARK: Segue
    
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
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        
        let detail = self.storyboard.instantiateViewControllerWithIdentifier("Detail") as DetailViewController
        detail.person = self.people[indexPath.row]
        
        if self.navigationController {
            self.navigationController.pushViewController(detail, animated: true)
        }
    }
    
    func addPersonAction() {
        let detail = self.storyboard.instantiateViewControllerWithIdentifier("Detail") as DetailViewController
        
        var newPerson = Person(firstName: "", lastName: "")
        newPerson.twitterHandle = nil
        newPerson.githubHandle = nil
        
        self.people.append(newPerson)
        
        detail.person = newPerson
        
        if self.navigationController {
            self.navigationController.pushViewController(detail, animated: true)
        }
    }
    
}
