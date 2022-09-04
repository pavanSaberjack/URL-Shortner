//
//  URLShortenerServiceTests.swift
//  TinyURLTests
//
//  Created by Pavan on 04/09/22.
//

import XCTest
@testable import URL_Shortner

class FakeURLShortenerService: URLShortenerService {
    func getShortURL(longURL: URL) throws -> URL? {
        return nil
    }
    
    func getOriginalURL(shortURL: URL) throws -> URL? {
        return nil
    }
    
    var baseURL: URL {
        return URL(string: "https://app.diagrams.net/")!
    }
}

class URLShortenerServiceTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testForBaseURL() throws {
        let service = FakeURLShortnerService()
        let url = URL(string: "https://app.diagrams.net/")!
        XCTAssertEqual(service.baseURL, url)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
