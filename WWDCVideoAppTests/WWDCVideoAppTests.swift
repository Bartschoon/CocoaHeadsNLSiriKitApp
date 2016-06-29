//
//  WWDCVideoAppTests.swift
//  WWDCVideoAppTests
//
//  Created by Wouter Steidl on 29/06/16.
//  Copyright © 2016 CocoaHeads. All rights reserved.
//

import XCTest
@testable import WWDCVideoApp

class WWDCVideoAppTests: XCTestCase {
    
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
    
    func testSessionsCreation()
    {
        let sessions = Sessions(sessionData: SessionDataMocked())
        let session = sessions.sessionList.first
        
        XCTAssert(session?.focus.count == 2)
        XCTAssert(session?.keywords.count == 28)
        XCTAssertEqual(session?.title, "Intermediate Swift")
        XCTAssertEqual(session?.track, "Tools")
        XCTAssertEqual(session?.description, "Explore the modern features of the Swift programming language. Learn about object initialization, closures, and optionals. See how you can perform pattern matching using Swift\'s powerful switch statements.")
        XCTAssertEqual(session?.url?.absoluteString, "http://devstreaming.apple.com/videos/wwdc/2014/403xxksrj0qs8c0/403/ref.mov")
        XCTAssertEqual(session?.urlHD?.absoluteString, "http://devstreaming.apple.com/videos/wwdc/2014/403xxksrj0qs8c0/403/403_hd_intermediate_swift.mov")
        XCTAssertEqual(session?.urlSD?.absoluteString, "http://devstreaming.apple.com/videos/wwdc/2014/403xxksrj0qs8c0/403/403_sd_intermediate_swift.mov")
        XCTAssertEqual(session?.year, 2014)
    }
    
}
