//
//  DetailViewController.swift
//  ClassRosterB19
//
//  Created by Jeff Gayle on 7/22/14.
//  Copyright (c) 2014 Jeff Gayle. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITraitEnvironment {
    
    //MARK: Variables/Outlets/Puppy Array
    var person : Person!
    
    @IBOutlet weak var firstNameTextField: UITextField!

    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var personImageView: UIImageView!
    
    @IBOutlet weak var twitterHandleTextField: UITextField!
    @IBOutlet weak var githubHandleTextField: UITextField!
    
    @IBOutlet weak var topImageViewConstraint: NSLayoutConstraint!
    @IBOutlet weak var centeringImageViewConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var topFirstNameConstraint: NSLayoutConstraint!
    @IBOutlet weak var centeringFirstNameConstraint: NSLayoutConstraint!
    
    let textFieldPadding = 100
    
    var imagePicker = UIImagePickerController()
    
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
        
        self.traitCollection.horizontalSizeClass    
        super.viewDidLoad()
        self.title = "Detail"
        self.navigationController.navigationItem.title = "Detail"
        
        let camera = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Camera, target: self, action: "changePicture:")
        
        self.navigationItem.rightBarButtonItem = camera
        
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
        
        let imageTap = UITapGestureRecognizer(target: self, action: "changeOrDeleteImage:")
        
        self.personImageView.addGestureRecognizer(imageTap)
        
    }
    
    override func viewWillAppear(animated: Bool) {
        personImageView.layer.cornerRadius = 0.5 * self.personImageView.frame.width
        personImageView.layer.masksToBounds = true
        println(self.view.frame.height)
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
        
        let newY = self.view.bounds.origin.y + textField.frame.origin.y - CGFloat(self.textFieldPadding)
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
    
    //MARK: Image Picker
    
    func changePicture(sender: AnyObject) {
        println("Button capture")
        self.imagePicker.delegate = self
        self.imagePicker.editing = true
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
            let alertController = UIAlertController(title: "Choose Source Type", message: "Please choose a picture source", preferredStyle: UIAlertControllerStyle.ActionSheet)
            
            let cameraOption = UIAlertAction(title: "Camera", style: UIAlertActionStyle.Default, handler: {
                (action: UIAlertAction!) -> Void in
                self.imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
                self.presentViewController(self.imagePicker, animated: true, completion: nil)
                })
            
            let photoLibraryOption = UIAlertAction(title: "Photo Library", style: UIAlertActionStyle.Default, handler: {
                (action: UIAlertAction!) -> Void in
                self.imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
                self.presentViewController(self.imagePicker, animated: true, completion: nil)
                })
            
            let cancelOption = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
            
            alertController.addAction(cameraOption)
            alertController.addAction(photoLibraryOption)
            alertController.addAction(cancelOption)
            self.presentViewController(alertController, animated: true, completion: nil)
            
        } else {
            self.imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            self.presentViewController(self.imagePicker, animated: true, completion: nil)
        }
        
    }
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]!) {
        let image = info[UIImagePickerControllerOriginalImage] as UIImage
        self.personImageView.image = image
//        self.saveToDocumentsDirectory(image)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    //MARK: Landscape layouts for 4s and 5s
    
    override func traitCollectionDidChange(previousTraitCollection: UITraitCollection!) {
        println(self.traitCollection.verticalSizeClass.toRaw())
        
        var centeringImageViewConstant = CGFloat(0.0)
        var centeringFirstNameConstant = CGFloat(0.0)
        var topImageViewConstant = CGFloat(180.0)
        var topFirstNameConstant = CGFloat(8.0)
        
        
        println(self.view.frame.height)
        if self.view.frame.height == 320.0 {
            centeringImageViewConstant = 130.0
            centeringFirstNameConstant = -115.0
            topImageViewConstant = 40.0
            topFirstNameConstant = 65.0
        }
        else {
            centeringImageViewConstant = 180.0
            centeringFirstNameConstant = -150.0
            topImageViewConstant = 30.0
            topFirstNameConstant = 60.0
        }
        
        if self.traitCollection.verticalSizeClass == UIUserInterfaceSizeClass.Compact {
            println("Changed")
            println(topImageViewConstraint.constant)
            topImageViewConstraint.constant = topImageViewConstant
            println(topImageViewConstraint.constant)
            
            println(centeringImageViewConstraint.constant)
            centeringImageViewConstraint.constant = centeringImageViewConstant
            println(centeringImageViewConstraint.constant)

            println(topFirstNameConstraint.constant)
            topFirstNameConstraint.constant = topFirstNameConstant
            println(topFirstNameConstraint.constant)

            println(centeringFirstNameConstraint.constant)
            centeringFirstNameConstraint.constant = centeringFirstNameConstant
            println(centeringFirstNameConstraint.constant)

        } else if self.traitCollection.verticalSizeClass == UIUserInterfaceSizeClass.Regular {
            println(topImageViewConstraint.constant)
            topImageViewConstraint.constant = 180
            println(topImageViewConstraint.constant)
            
            println(centeringImageViewConstraint.constant)
            centeringImageViewConstraint.constant = 0
            println(centeringImageViewConstraint.constant)
            
            println(topFirstNameConstraint.constant)
            topFirstNameConstraint.constant = 8
            println(topFirstNameConstraint.constant)
            
            println(centeringFirstNameConstraint.constant)
            centeringFirstNameConstraint.constant = 0
            println(centeringFirstNameConstraint.constant)

        }
    }
    
    //MARK: GestureRecognizer
    
    func changeOrDeleteImage(sender: AnyObject) {
        println("Image pressed")
        
        let alertController = UIAlertController(title: "Delete?", message: "Are you sure you would like to delete the image?", preferredStyle: UIAlertControllerStyle.ActionSheet)
        
        let cancelOption = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
        
        let deleteOption = UIAlertAction(title: "Delete", style: UIAlertActionStyle.Destructive, handler: {(action: UIAlertAction!) -> Void in
            
            self.personImageView.image = nil
            
            })
        
        let cameraOption = UIAlertAction(title: "Camera", style: UIAlertActionStyle.Default, handler: {(action: UIAlertAction!) -> Void in
            
            self.imagePicker.delegate = self
            self.imagePicker.editing = true
            self.imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
            self.presentViewController(self.imagePicker, animated: true, completion: nil)
            
            })
        
        let photoOption = UIAlertAction(title: "Photo Library", style: UIAlertActionStyle.Default, handler: {(action: UIAlertAction!) -> Void in
            
            self.imagePicker.delegate = self
            self.imagePicker.editing = true
            self.imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            self.presentViewController(self.imagePicker, animated: true, completion: nil)
            
            })
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
            alertController.addAction(cancelOption)
            alertController.addAction(deleteOption)
            alertController.addAction(cameraOption)
            alertController.addAction(photoOption)
        } else {
            alertController.addAction(cancelOption)
            alertController.addAction(deleteOption)
            alertController.addAction(photoOption)
        }
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    

}
