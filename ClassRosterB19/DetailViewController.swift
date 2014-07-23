//
//  DetailViewController.swift
//  ClassRosterB19
//
//  Created by Jeff Gayle on 7/22/14.
//  Copyright (c) 2014 Jeff Gayle. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate {
    
    

    //MARK: Variables/Outlets
    var person : Person!
    
    @IBOutlet weak var firstNameTextField: UITextField!

    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var personImageView: UIImageView!
    
    @IBOutlet weak var twitterHandleTextField: UITextField!
    @IBOutlet weak var githubHandleTextField: UITextField!
    
    let textFieldPadding = 100
    
    func loadPuppyArray() -> UIImage {
        
        let huskyPuppy = UIImage(named: "Husky Puppy.jpg")
        let angryPuppy = UIImage(named: "angryPuppy.jpg")
        let derpPuppy = UIImage(named: "derpPuppy.jpg")
        let walkingPuppies = UIImage(named: "dogWalkingPuppies.jpeg")
        let guiltyPuppy = UIImage(named: "guilyPuppy.jpeg")
        let labPuppy = UIImage(named: "labPuppy.jpg")
        let puppyAndBunny = UIImage(named: "puppyAndBunny.jpg")
        let sadPom = UIImage(named: "sadPom.jpeg")
        let sleepingPuppy = UIImage(named: "sleepingPuppy.jpg")
        let smallPuppy = UIImage(named: "smallPuppy.jpeg")
        let yawningPuppy = UIImage(named: "yawningPuppy.jpg")
        
        let puppiesArray : [UIImage] = [huskyPuppy, angryPuppy, derpPuppy, walkingPuppies, guiltyPuppy, labPuppy, puppyAndBunny, sadPom, sleepingPuppy, smallPuppy, yawningPuppy]
        
        let randomIndex = Int(arc4random_uniform(UInt32(puppiesArray.count)))
        
        return (puppiesArray[randomIndex])
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadPuppyArray()
        
        firstNameTextField.text = person.firstName
        lastNameTextField.text = person.lastName
        
        if person.image? == nil {
            personImageView.image = self.loadPuppyArray()
        } else {
            personImageView.image = person.image
        }

        twitterHandleTextField.text = person.twitterHandle?
        githubHandleTextField.text = person.githubHandle?
        
    }
    
    override func viewWillAppear(animated: Bool) {
        personImageView.layer.cornerRadius = 0.5 * self.personImageView.frame.width
        personImageView.layer.masksToBounds = true
    }
    
    override func viewWillDisappear(animated: Bool) {
        person.firstName = firstNameTextField.text
        person.lastName = lastNameTextField.text
        person.image = personImageView.image
        person.twitterHandle = twitterHandleTextField.text
        person.githubHandle = githubHandleTextField.text
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Text Field Methods
    
    func textFieldDidBeginEditing(textField: UITextField!) {
        let currentWidth = self.view.bounds.width
        let currentHeight = self.view.bounds.height
        
        let newY = self.view.bounds.origin.y + textField.frame.origin.y - self.textFieldPadding
        let currentX = self.view.bounds.origin.x
        
        UIView.animateWithDuration(0.3, animations: { () -> Void
            in
            
            self.view.bounds = CGRect(x: currentX, y: newY, width: currentWidth, height: currentHeight)
            
            })
        // Could also be
        // UIView.animateWithDuration(0.4) {
        //     self.view.bounds = CGRect(x: 0, y: 0, width: currentWidth, height:
        //         currentHeight)
        // }
    }
    
    func textFieldDidEndEditing(textField: UITextField!) {
        let currentWidth = self.view.bounds.width
        let currentHeight = self.view.bounds.height
        
        UIView.animateWithDuration(0.3, animations: { () -> Void
            in
            
            self.view.bounds = CGRect(x: 0, y: 0, width: currentWidth, height: currentHeight)
            
            })
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(touches: NSSet!, withEvent event: UIEvent!) {
        for control in self.view.subviews {
            if let theControl = control as? UITextField {
                theControl.resignFirstResponder()
            }
        }
        
        // self.view.endEditing(true) -> Another way of doing it
    }

}
