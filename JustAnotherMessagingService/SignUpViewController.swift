//
//  SignUpViewController.swift
//  JustAnotherMessagingService
//
//  Created by Dominic Schira on 9/19/16.
//  Copyright © 2016 Dominic Schira. All rights reserved.
//

import UIKit


class SignUpViewController: UIViewController {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signUpAction(sender: AnyObject) {
        
        var username = self.usernameField.text
        var password = self.passwordField.text
        var email = self.emailField.text
//        var finalEmail = email.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
//        
//        // Validate the text fields
//        if count(username) < 5 {
//            var alert = UIAlertView(title: "Invalid", message: "Username must be greater than 5 characters", delegate: self, cancelButtonTitle: "OK")
//            alert.show()
//            
//        } else if count(password) < 8 {
//            var alert = UIAlertView(title: "Invalid", message: "Password must be greater than 8 characters", delegate: self, cancelButtonTitle: "OK")
//            alert.show()
//            
//        } else if count(email) < 8 {
//            var alert = UIAlertView(title: "Invalid", message: "Please enter a valid email address", delegate: self, cancelButtonTitle: "OK")
//            alert.show()
//            
//        } else {
//            // Run a spinner to show a task in progress
//            var spinner: UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRectMake(0, 0, 150, 150)) as UIActivityIndicatorView
//            spinner.startAnimating()
//            
//            var newUser = PFUser()
//            
//            newUser.username = username
//            newUser.password = password
//            newUser.email = finalEmail
//            
//            // Sign up the user asynchronously
//            newUser.signUpInBackgroundWithBlock({ (succeed, error) -> Void in
//                
//                // Stop the spinner
//                spinner.stopAnimating()
//                if ((error) != nil) {
//                    var alert = UIAlertView(title: "Error", message: "\(error)", delegate: self, cancelButtonTitle: "OK")
//                    alert.show()
//                    
//                } else {
//                    var alert = UIAlertView(title: "Success", message: "Signed Up", delegate: self, cancelButtonTitle: "OK")
//                    alert.show()
//                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
//                        let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("Home") as! UIViewController
//                        self.presentViewController(viewController, animated: true, completion: nil)
//                    })
//                }
//            })
//        }
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
