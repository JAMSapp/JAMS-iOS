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

    
    // MARK: Sign Up Function
    @IBAction func signUpAction(sender: AnyObject) {
        
        dismissKeyboard()
        
        let username = self.usernameField.text
        let password = self.passwordField.text
        // TODO: Add email
//        let email = self.emailField.text
        
        // check pasword field
        if (password?.isEmpty)! {
            // TODO: Add notifcation
            print("password is empty")
            
        } else if (username?.isEmpty)! {
            // TODO: Add notifcation
            print("username is empty")
            
        }
        else {
            let rect = CGRect(origin: CGPoint(x: 0,y :0), size: CGSize(width: 100, height: 100))
            let spinner: UIActivityIndicatorView = UIActivityIndicatorView(frame: rect) as UIActivityIndicatorView
            spinner.startAnimating()
            
            // MARK: Network Calls
            let request = NSMutableURLRequest(url: NSURL(string: K.URL.CreateUserPath)! as URL)
            let session = URLSession.shared
            request.httpMethod = "POST"
            
            let params = ["username":username!, "password":password!] as Dictionary<String, String>
            
            request.httpBody = try? JSONSerialization.data(withJSONObject: params, options: [])
            
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("application/json", forHTTPHeaderField: "Accept")
            
            
            
            let task = session.dataTask(with: request as URLRequest, completionHandler: {(data, response, error) -> Void in
                
                spinner.stopAnimating()
                
                
                if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 201 {
                    // check for http errors

                    
                    print("statusCode should be 201, but is \(httpStatus.statusCode)")
                    
                    if httpStatus.statusCode == 409 {
                        // TODO: Add notifcation
                        print("username already taken")
                        
                    }
                    print("response = \(response)")
                } else {
                    do {
                        let object = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [String:AnyObject]
                        
                        let userID = object?["Id"] as? String
                        // TODO: Change email
                        let user = User(username: username!, email: "t@tits.com", userID: userID!)
                        print("user = \(user?.description)")
                        
                        
                        // MARK: Segue
                        DispatchQueue.main.async {
                            let login = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as! UITableViewController
                            self.present(login, animated: true)}

                    } catch {
                        // Handle Error
                        
                        print("User not created")
                    }
                }
                
                // TODO: Check data! != nil
                if data != nil {
                    let responseString = String(data: data!, encoding: .utf8)
                    print("responseString = \(responseString)")
                } else {
                    print("Server Unavalible")
                }
            })
            
            task.resume()
            

        }
        
    }
    
    // MARK: Keyboard dismissal
    
    func dismissKeyboard() {
        passwordField.resignFirstResponder()
    }

}
