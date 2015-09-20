//
//  SignupViewController.swift
//  SwiftNextStep
//
//  Created by Icaro Barreira Lavrador on 13/09/15.
//  Copyright (c) 2015 Icaro Barreira Lavrador. All rights reserved.
//

class SNSignUpViewController: PFSignUpViewController{

    var fieldsBackground:UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        self.signUpView?.backgroundColor = UIColor.blackColor()
        
        let logoLabel = UILabel()
        logoLabel.sizeToFit()
        logoLabel.lineBreakMode = .ByWordWrapping
        logoLabel.numberOfLines = 2
        logoLabel.textAlignment = .Center
        logoLabel.textColor = UIColor.grayForLabels()
        logoLabel.text = "Swift\nNext Step"
        
        self.signUpView?.logo = logoLabel
        
        self.signUpView?.additionalField?.placeholder = "Phone number"
        
        fieldsBackground = UIView(frame: CGRectZero)
        
        self.signUpView?.insertSubview(fieldsBackground!, atIndex: 1)
    }
    
    override func viewDidLayoutSubviews() {
        
        if (self.signUpView?.usernameField != nil) && (self.signUpView?.additionalField != nil){
            
            let oldLogoFrame = self.signUpView!.logo!.frame
            let newLogoFrame = CGRectMake(oldLogoFrame.minX - 25, oldLogoFrame.minY - 50, oldLogoFrame.width + 25 + 25, oldLogoFrame.height + 50)
            self.signUpView!.logo!.frame = newLogoFrame
    
            
            let oldUserFrame = self.signUpView!.usernameField!.frame
            let newUserFrame = CGRectMake(oldUserFrame.minX + 15, oldUserFrame.minY, oldUserFrame.width - 15 - 15, oldUserFrame.height)
            self.signUpView!.usernameField!.frame = newUserFrame
            
            let oldPasswordFrame = self.signUpView!.passwordField!.frame
            let newPasswordFrame = CGRectMake(oldPasswordFrame.minX + 15, oldPasswordFrame.minY, oldPasswordFrame.width - 15 - 15, oldPasswordFrame.height)
            self.signUpView!.passwordField!.frame = newPasswordFrame
            
            let oldEmailFrame = self.signUpView!.emailField!.frame
            let newEmailFrame = CGRectMake(oldEmailFrame.minX + 15, oldEmailFrame.minY, oldEmailFrame.width - 15 - 15, oldEmailFrame.height)
            self.signUpView!.emailField!.frame = newEmailFrame
            
            let oldAdditionalFrame = self.signUpView!.additionalField!.frame
            let newAdditionalFrame = CGRectMake(oldAdditionalFrame.minX + 15, oldAdditionalFrame.minY, oldAdditionalFrame.width - 15 - 15, oldAdditionalFrame.height)
            self.signUpView!.additionalField!.frame = newAdditionalFrame
            
            let loginFieldsLeft = self.signUpView!.usernameField!.frame.origin.x
            let loginFieldsTop = self.signUpView!.usernameField!.frame.origin.y
            let loginFieldsBottom = self.signUpView!.additionalField!.frame.maxY
            let loginFieldsWidth = self.signUpView!.additionalField!.frame.size.width + 5 + 5
            let loginFieldsHigth = (loginFieldsBottom - loginFieldsTop) + 5 + 5
            
            fieldsBackground!.frame = CGRectMake(loginFieldsLeft - 5, loginFieldsTop - 5, loginFieldsWidth, loginFieldsHigth)
            fieldsBackground?.backgroundColor = UIColor.middleGray()
        }
    }
}
