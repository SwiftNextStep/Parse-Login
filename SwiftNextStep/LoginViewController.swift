//
//  LoginViewController.swift
//  SwiftNextStep
//
//  Created by Icaro Barreira Lavrador on 13/09/15.
//  Copyright (c) 2015 Icaro Barreira Lavrador. All rights reserved.
//

class LoginViewController: UIViewController {
    
    let logInViewController = SNLoginViewController()
    let signUpViewController = SNSignUpViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logInViewController.delegate = self
        logInViewController.fields = [.DismissButton, .Facebook, .LogInButton, .PasswordForgotten, .SignUpButton, .Twitter, .UsernameAndPassword]
        signUpViewController.delegate = self
        signUpViewController.fields = [.Default, .Additional]
        logInViewController.signUpController = signUpViewController
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        presentViewController(logInViewController, animated: true, completion: nil)
    }
}

extension LoginViewController: PFLogInViewControllerDelegate{
    func logInViewController(logInController: PFLogInViewController, didLogInUser user: PFUser) {
        print("logvin user with name \(user.username)")
    }
}

extension LoginViewController: PFSignUpViewControllerDelegate{
    func signUpViewController(signUpController: PFSignUpViewController, didSignUpUser user: PFUser) {
        print("sign up user with name \(user.username)")
    }
}
