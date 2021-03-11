//
//  UserCacheServiceTest.swift
//  GitHubProfileViewerTests
//
//  Created by Lahiru Pinto on 3/11/21.
//

@testable import GitHubProfileViewer
import XCTest

class UserCacheServiceTest: XCTestCase {
    
    var cacheServie: UserCacheService!
    
    override func setUp() {
        super.setUp()
        cacheServie = UserCacheService()
    }
    
    override func tearDown() {
        cacheServie = nil
        super.tearDown()
    }
    
    func testCachedTimeValidationTrue(){
        let cacheTime = Calendar.current.date(byAdding: .hour, value: -24, to: Date())!
        let isValid = cacheServie.isCachedTimeValid(cachedTime: cacheTime)
        
        XCTAssertTrue(isValid)
    }
    
    func testCachedTimeValidationFalse(){
        let cacheTime = Calendar.current.date(byAdding: .day, value: -2, to: Date())!
        let isValid = cacheServie.isCachedTimeValid(cachedTime: cacheTime)
        
        XCTAssertFalse(isValid)
    }

}
