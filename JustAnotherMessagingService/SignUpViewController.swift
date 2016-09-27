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
        
        dismissKeyboard()
        
        let username = self.usernameField.text
        let password = self.passwordField.text
//        let email = self.emailField.text
        
        // Set up the url
        let request = NSMutableURLRequest(url: NSURL(string: K.URL.Path)! as URL)
        let session = URLSession.shared
        request.httpMethod = "POST"
        
        let params = ["username":username!, "password":password!] as Dictionary<String, String>
        
        request.httpBody = try? JSONSerialization.data(withJSONObject: params, options: [])
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let task = session.dataTask(with: request as URLRequest, completionHandler: {data, response, error -> Void in
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 201 {           // check for http errors
                print("statusCode should be 201, but is \(httpStatus.statusCode)")
                print("response = \(response)")}
            do {
                let object = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [String:AnyObject]
                
                let userID = object?["Id"] as? String
                let user = User(username: username!, email: "t@tits.com", userID: userID!)
                print(user?.description)
                
                
            } catch {
                // Handle Error
            }

            if data != nil {
                let responseString = String(data: data!, encoding: .utf8)
                print("responseString = \(responseString)")
            } else {
                print("SERVER NOT RESPONDING")
            }
        })
        
        
        task.resume()
        

    }
    
    // MARK: Keyboard dismissal
    
    func dismissKeyboard() {
        passwordField.resignFirstResponder()
    }


}
