//
//  DetailViewController.swift
//  ClassRosterB19
//
//  Created by Jeff Gayle on 7/22/14.
//  Copyright (c) 2014 Jeff Gayle. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var person : Person!
    
    @IBOutlet weak var firstNameTextField: UITextField!

    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var personImageView: UIImageView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstNameTextField.text = person.firstName
        lastNameTextField.text = person.lastName
        personImageView.image = person.image?

    }
    
    override func viewWillDisappear(animated: Bool) {
        person.firstName = firstNameTextField.text
        person.lastName = lastNameTextField.text
        person.image = personImageView.image
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // #pragma mark - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
