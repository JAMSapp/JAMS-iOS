//
//  JustAnotherMessagingServiceTests.swift
//  JustAnotherMessagingServiceTests
//
//  Created by Dominic Schira on 9/18/16.
//  Copyright © 2016 Dominic Schira. All rights reserved.
//

import XCTest
@testable import JustAnotherMessagingService


class JustAnotherMessagingServiceTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
// MARK: User Unit Tests
    // Tests to confirm that the User initializer returns properly.
    func testUserInitialization() {
        // Success case
        let testUser = User(username: "Test Username", email: "Test@JAMSapp.com", userID: "1234ABCD")
        XCTAssertNotNil(testUser)
        
        // Failure cases
        // Empty username
        let failUsername = User(username: "", email: "Test@JAMSapp.com", userID: "1234ABCD")
        XCTAssertNil(failUsername, "Empty username is invalid")
        
        // Empty email
        let failEmail = User(username: "Test Username", email: "", userID: "1234ABCD")
        XCTAssertNil(failEmail, "Empty email is invalid")
        
        // Empty userID
        let failUserID = User(username: "Test Username", email: "Test@JAMSapp.com", userID: "")
        XCTAssertNil(failUserID, "Empty userID is invalid")


    }
    
}
