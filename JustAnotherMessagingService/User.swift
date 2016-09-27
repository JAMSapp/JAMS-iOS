//
//  User.swift
//  JustAnotherMessagingService
//
//  Created by Dominic Schira on 9/26/16.
//  Copyright © 2016 Dominic Schira. All rights reserved.
//

// This class is used to keep track of a user and that users data

import UIKit


class User {
    
    // MARK: Properties
    var username: String
    var email: String
    var userID: String
    
    // MARK: Initialization
    init?(username : String, email: String, userID: String) {
        // Initialize stored properties.
        self.username = username
        self.email = email
        self.userID = userID
        
        // Initialization should fail if one of the user feilds is missing
        if username.isEmpty || email.isEmpty || userID.isEmpty {
            return nil
        }
    }

}
