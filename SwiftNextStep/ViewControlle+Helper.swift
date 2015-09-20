//
//  ViewControlle+Helper.swift
//  SwiftNextStep
//
//  Created by Icaro Barreira Lavrador on 6/09/15.
//  Copyright (c) 2015 Icaro Barreira Lavrador. All rights reserved.
//

extension UIViewController {
    
    func presentViewControllerFromVisibleViewController(viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)?) {
        if self is UINavigationController {
            let navigationController = self as! UINavigationController
            navigationController.topViewController!.presentViewControllerFromVisibleViewController(viewControllerToPresent, animated: true, completion: nil)
        } else if (presentedViewController != nil) {
            presentedViewController!.presentViewControllerFromVisibleViewController(viewControllerToPresent, animated: true, completion: nil)
        } else {
            presentViewController(viewControllerToPresent, animated: true, completion: nil)
        }
    }
}
