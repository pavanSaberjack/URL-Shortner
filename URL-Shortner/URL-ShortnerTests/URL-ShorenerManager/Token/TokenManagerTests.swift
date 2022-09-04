//
//  TokenManagerTests.swift
//  URL-ShortnerTests
//
//  Created by Pavan on 04/09/22.
//

import XCTest
@testable import URL_Shortner

class FakeTokenGenerator: TokenService {
    var failGenerator = false
    
    func getTokensList() throws -> [String] {
        if failGenerator {
            throw TokenGeneratorError.tokenError
        }
        
        return ["abc", "bcd"]
    }
}

class TokenManagerTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testTokenList() throws {
        TokenManager.shared.tokenGenerator = FakeTokenGenerator()
        XCTAssertEqual(["abc", "bcd"], try? TokenManager.shared.getTokensList())
    }
    
    func testFailureScenario() throws {
        let tokenService = FakeTokenGenerator()
        tokenService.failGenerator = true
        
        TokenManager.shared.tokenGenerator = tokenService
        
        do {
            _ = try TokenManager.shared.getTokensList()
        } catch {
            XCTAssertEqual(TokenGeneratorError.tokenError, error as! TokenGeneratorError)
        }                
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
