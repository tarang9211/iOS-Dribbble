//
//  DribbleTests.swift
//  DribbleTests
//
//  Created by Tarang Hirani on 12/26/16.
//  Copyright © 2016 Tarang Hirani. All rights reserved.
//

import XCTest
@testable import Dribble

class DribbleTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testURLIsAppropriate() {
        let url = Config.rootUrl + "?access_token=\(Config.accessToken)"
        XCTAssertNotNil(url, "URL is not nil")
    }
    
}
