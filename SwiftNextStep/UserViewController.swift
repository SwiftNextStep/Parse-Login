//
//  UserViewController.swift
//  SwiftNextStep
//
//  Created by Icaro Barreira Lavrador on 8/09/15.
//  Copyright (c) 2015 Icaro Barreira Lavrador. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {

    @IBOutlet weak var usernameTexField: UITextField!
    @IBOutlet weak var objectIdTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var creatAtTextField: UITextField!
    @IBOutlet weak var updateAtTextField: UITextField!
    
    @IBAction func backButtonAction(sender: UIButton) {
        PFUser.logOut()
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        if let user = PFUser.currentUser(){
            objectIdTextField.text = user.objectId
            usernameTexField.text = user.username
            emailTextField.text = user.email
            creatAtTextField.text = NSDateFormatter.localizedStringFromDate(user.createdAt!, dateStyle: .ShortStyle, timeStyle: .ShortStyle)
            updateAtTextField.text = NSDateFormatter.localizedStringFromDate(user.updatedAt!, dateStyle: .ShortStyle, timeStyle: .ShortStyle)
        }
    }
    
}
