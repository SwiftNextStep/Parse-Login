//
//  MainTableViewController.swift
//  SwiftNextStep
//
//  Created by Icaro Barreira Lavrador on 7/09/15.
//  Copyright (c) 2015 Icaro Barreira Lavrador. All rights reserved.
//

import UIKit

enum UIType: Int{
    
    case LogInDefault
    case LogInCustom
    case LogInCustomPlus
    case LogInFullyCustom
    case LogInDefaultNavigation
    case LogInCustomNavigation
    
    static var count: Int{
        var count = 0
        while let _ = self.init(rawValue: ++count)  {}
        return count
    }
}

extension UIType: CustomStringConvertible{
    var description: String{
        switch(self){
        case LogInDefault:
            return "Log In Default"
        case LogInCustom:
            return "Log in Custom"
        case LogInCustomPlus:
            return "Log in Custom Plus"
        case LogInFullyCustom:
            return "Log in Fully Custom"
        case LogInDefaultNavigation:
            return "Log In Default Navigation"
        case LogInCustomNavigation:
            return "Log in Custom Navigation"
        }
    }
}

class MainTableViewController: UITableViewController {
    
    func dissmissCurrentControllerAndPresentUserViewController(){
        dismissViewControllerAnimated(false, completion: nil)
        let storybord = UIStoryboard(name: "Main", bundle: nil)
        let userView = storybord.instantiateViewControllerWithIdentifier("StoryboardUser") as! UserViewController
        let window = UIApplication.sharedApplication().windows[0] 
        window.rootViewController?.presentViewController(userView, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if PFUser.currentUser() != nil{
            PFUser.logOut()
        }
    }
    
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return UIType.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) 
        cell.textLabel?.text = UIType(rawValue: indexPath.row)?.description
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if let uiType = UIType(rawValue: indexPath.row){
            var logInViewController = UIViewController()
            switch(uiType){
            case .LogInFullyCustom:
                logInViewController = LoginViewController()
                break
            default:
                logInViewController = createLogInViewController(uiType)
            }
            presentViewController(logInViewController, animated: true, completion: nil)
        }
    }

    func createLogInViewController(uiType: UIType) -> PFLogInViewController{
        let logInViewController = PFLogInViewController()
        
        //setup log in
        logInViewController.delegate = self
        if (uiType == .LogInCustom) || (uiType == .LogInCustomPlus){
            logInViewController.fields = [.DismissButton, .Facebook, .LogInButton, .PasswordForgotten, .SignUpButton, .Twitter, .UsernameAndPassword]
        }
        //Setup Colors and Logo
        if (uiType == .LogInCustomPlus){
            let gradientLogin = CAGradientLayer().LoginAppGradiend()
            gradientLogin.frame = UIScreen.mainScreen().bounds
            logInViewController.view.layer.insertSublayer(gradientLogin, atIndex: 0)
            
            logInViewController.logInView?.logo = UIImageView(image: UIImage(named: "LoginIcon"))
            logInViewController.logInView?.logo?.contentMode = .ScaleAspectFill
            
            logInViewController.logInView?.logInButton?.setBackgroundImage(nil, forState: .Normal)
            logInViewController.logInView?.logInButton?.backgroundColor = UIColor.greenButton()
            logInViewController.logInView?.logInButton?.setTitleColor(UIColor.blackColor(), forState: .Normal)
            
            logInViewController.logInView?.passwordForgottenButton?.setTitleColor(UIColor.grayForLabels(), forState: .Normal)
        }
        //setup sign up
        logInViewController.signUpController?.delegate = self
        if (uiType == .LogInCustom) || (uiType == .LogInCustomPlus){
            logInViewController.signUpController?.fields = [.DismissButton, .Email, .SignUpButton, .UsernameAndPassword]
        }
        if (uiType == .LogInCustomPlus){
            let gradientSignup = CAGradientLayer().LoginAppGradiend()
            gradientSignup.frame = UIScreen.mainScreen().bounds
            logInViewController.signUpController?.view.layer.insertSublayer(gradientSignup, atIndex: 0)
            logInViewController.signUpController?.signUpView?.logo = UIImageView(image: UIImage(named: "LoginIcon"))
            logInViewController.signUpController?.signUpView?.logo?.contentMode = .ScaleAspectFill
            
            logInViewController.signUpController?.signUpView?.signUpButton?.setBackgroundImage(nil, forState: .Normal)
            logInViewController.signUpController?.signUpView?.signUpButton?.backgroundColor = UIColor.greenButton()
            logInViewController.signUpController?.signUpView?.signUpButton?.setTitleColor(UIColor.blackColor(), forState: .Normal)
        }
        return logInViewController
    }
    
}

extension MainTableViewController: PFLogInViewControllerDelegate{
    func logInViewController(logInController: PFLogInViewController, didLogInUser user: PFUser) {
        dissmissCurrentControllerAndPresentUserViewController()
    }
}

extension MainTableViewController:PFSignUpViewControllerDelegate{
    func signUpViewController(signUpController: PFSignUpViewController, didSignUpUser user: PFUser) {
        dissmissCurrentControllerAndPresentUserViewController()
    }
}
