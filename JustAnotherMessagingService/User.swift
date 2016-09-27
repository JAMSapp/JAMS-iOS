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
    var firstName: String
    var lastName: String
    var email: String
    var userID: String
    
    // MARK: Initialization
    init(username : String, email: String, userID: String) {
        self.username = username
        self.email = email
        self.userID = userID
        self.firstName = ""
        self.lastName = ""
    }
    //If the user provides a first and last name
    init(username : String, email: String, userID: String, first: String, last: String) {
        self.username = username
        self.email = email
        self.userID = userID;
        self.firstName = first
        self.lastName = last
    }

}
