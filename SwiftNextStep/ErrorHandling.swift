//
//  ErrorHandling.swift
//  
//
//  Created by Icaro Barreira Lavrador on 6/09/15.
//
//

import Foundation

struct ErrorHandling{
    
    static let errorTitle = "Error"
    static let errorMessage = "Something unexpected happened!"
    static let errorButton = "Ok"
    
    
    static func defaultErrorHandler(error:NSError?){
        
        var alertMessage = String()
        if let error = error{
            alertMessage = error.localizedDescription
        } else{
            alertMessage = errorMessage
        }
        
        let alert = UIAlertController(title: errorTitle, message: alertMessage, preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: errorButton, style: UIAlertActionStyle.Default, handler: nil))
        let window = UIApplication.sharedApplication().windows[0] 
        
        window.rootViewController?.presentViewControllerFromVisibleViewController(alert, animated: true, completion: nil)
    }
    
    static func errorHandlingCallback(success: Bool, error: NSError?) -> Void{
        
        var errorIsDisplaying = false
        if let error = error{
            errorIsDisplaying = true
            ErrorHandling.defaultErrorHandler(error)
        }
        if (!success) && (!errorIsDisplaying){
            ErrorHandling.defaultErrorHandler(nil)
        }
        
    }
    
}