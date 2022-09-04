//
//  URLShortenerManagerTests.swift
//  TinyURLTests
//
//  Created by Pavan on 04/09/22.
//

import XCTest
@testable import URL_Shortner

class FakeURLShortnerService: URLShortenerService {
    let shortURL = URL(string: "https://www.abc.com")!
    var originalURL: URL?
    
    
    func getShortURL(longURL: URL) throws -> URL? {
        originalURL = longURL
        return URL(string: "https://www.abc.com")!
    }
    
    func getOriginalURL(shortURL: URL) throws -> URL? {
        return originalURL
    }
}

class FakeURLShortnerFailureService: URLShortenerService {
    let shortURL = URL(string: "https://www.abc.com")!
    var originalURL: URL?
    
    
    func getShortURL(longURL: URL) throws -> URL? {
        originalURL = longURL
        throw URLShortenerError.someError
    }
    
    func getOriginalURL(shortURL: URL) throws -> URL? {
        throw URLShortenerError.someError
    }
}


class URLShortenerManagerTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSuccessScenario() throws {
        URLShortenerManager.shared.shortenerService = FakeURLShortnerService()
        
        let longUrl = URL(string: "https://www.google.com")!
        let shortURL = URL(string: "https://www.abc.com")!
        
        let url = try? URLShortenerManager.shared.getShortURL(longURL: longUrl)
        XCTAssertEqual(shortURL, url)
        
        let originalURL = try? URLShortenerManager.shared.getOriginalURL(shortURL: shortURL)
        XCTAssertEqual(originalURL, longUrl)
    }
    
    func testFailureCase() throws {
        URLShortenerManager.shared.shortenerService = FakeURLShortnerFailureService()
        
        let longUrl = URL(string: "https://www.google.com")!
        let shortURL = URL(string: "https://www.abc.com")!
        
        
        var customError: Error?
        do {
            _ = try URLShortenerManager.shared.getShortURL(longURL: longUrl)
        } catch {
            customError = error
        }
                
        XCTAssertEqual(customError as! URLShortenerError, URLShortenerError.someError)
        do {
            _ = try URLShortenerManager.shared.getOriginalURL(shortURL: shortURL)
        } catch {
            customError = error
        }
        XCTAssertEqual(customError as! URLShortenerError, URLShortenerError.someError)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
