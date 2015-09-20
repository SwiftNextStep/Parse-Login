//
//  SNLoginViewController.swift
//  SwiftNextStep
//
//  Created by Icaro Barreira Lavrador on 13/09/15.
//  Copyright (c) 2015 Icaro Barreira Lavrador. All rights reserved.
//

class SNLoginViewController: PFLogInViewController{
    
    var fieldsBackground:UIView?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.logInView?.backgroundColor = UIColor.blackColor()
        
        let logoLabel = UILabel()
        logoLabel.sizeToFit()
        logoLabel.lineBreakMode = .ByWordWrapping
        logoLabel.numberOfLines = 2
        logoLabel.textAlignment = .Center
        logoLabel.textColor = UIColor.grayForLabels()
        logoLabel.text = "Swift \n Next Step"
        self.logInView?.logo = logoLabel
        
        self.logInView?.passwordForgottenButton?.setTitleColor(UIColor.grayForLabels(), forState: .Normal)
        
        self.logInView?.facebookButton?.setTitle(nil, forState: .Normal)
        self.logInView?.facebookButton?.setTitle(nil, forState: .Highlighted)
        self.logInView?.facebookButton?.setImage(nil, forState: .Normal)
        self.logInView?.facebookButton?.setImage(nil, forState: .Highlighted)
        self.logInView?.facebookButton?.setBackgroundImage(UIImage(named: "facebook_bw"), forState: .Normal)
        
        self.logInView?.twitterButton?.setTitle(nil, forState: .Normal)
        self.logInView?.twitterButton?.setTitle(nil, forState: .Highlighted)
        self.logInView?.twitterButton?.setImage(nil, forState: .Normal)
        self.logInView?.twitterButton?.setImage(nil, forState: .Highlighted)
        self.logInView?.twitterButton?.setBackgroundImage(UIImage(named: "twitter_bw"), forState: .Normal)
        
        self.logInView?.signUpButton?.setTitle(nil, forState: .Normal)
        self.logInView?.signUpButton?.setTitle(nil, forState: .Highlighted)
        self.logInView?.signUpButton?.setImage(nil, forState: .Normal)
        self.logInView?.signUpButton?.setImage(nil, forState: .Highlighted)
        self.logInView?.signUpButton?.setBackgroundImage(UIImage(named: "sign_up_bw"), forState: .Normal)
        
        fieldsBackground = UIView(frame: CGRectZero)
        
        self.logInView?.insertSubview(fieldsBackground!, atIndex: 1)
    }
    
    override func viewDidLayoutSubviews() {
    
        self.logInView?.signUpButton?.setTitle(nil, forState: .Normal)
        self.logInView?.signUpButton?.setTitle(nil, forState: .Highlighted)
        
        let buttonWidth = (UIScreen.mainScreen().bounds.width - (30 + 30 + 50 + 50)) / 3
        let buttonTop = self.logInView!.facebookButton!.frame.origin.y
        
        self.logInView?.signUpButton?.frame = CGRectMake(30, buttonTop, buttonWidth, buttonWidth)
        self.logInView?.facebookButton?.frame = CGRectMake(30 + buttonWidth + 50, buttonTop, buttonWidth, buttonWidth)
        self.logInView?.twitterButton?.frame = CGRectMake(30 + buttonWidth + 50 + buttonWidth + 50, buttonTop, buttonWidth, buttonWidth)
        
        if (self.logInView?.usernameField != nil) && (self.logInView?.passwordField != nil){
            
            let oldUserFrame = self.logInView!.usernameField!.frame
            let newUserFrame = CGRectMake(oldUserFrame.minX + 15, oldUserFrame.minY, oldUserFrame.width - 15 - 15, oldUserFrame.height)
            self.logInView!.usernameField!.frame = newUserFrame
            
            let oldPasswordFrame = self.logInView!.passwordField!.frame
            let newPasswordFrame = CGRectMake(oldPasswordFrame.minX + 15, oldPasswordFrame.minY, oldPasswordFrame.width - 15 - 15, oldPasswordFrame.height)
            self.logInView!.passwordField!.frame = newPasswordFrame
            
            
            let loginFieldsLeft = self.logInView!.usernameField!.frame.origin.x
            let loginFieldsTop = self.logInView!.usernameField!.frame.origin.y
            let loginFieldsBottom = self.logInView!.passwordField!.frame.maxY
            let loginFieldsWidth = self.logInView!.usernameField!.frame.size.width + 5 + 5
            let loginFieldsHigth = (loginFieldsBottom - loginFieldsTop) + 5 + 5
            
            fieldsBackground!.frame = CGRectMake(loginFieldsLeft - 5, loginFieldsTop - 5, loginFieldsWidth, loginFieldsHigth)
            fieldsBackground?.backgroundColor = UIColor.middleGray()
        }
    }
}
