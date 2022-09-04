//
//  URLShortenerManager.swift
//  TinyURL
//
//  Created by Pavan on 03/09/22.
//

import Foundation

class URLShortenerManager: URLShortenerService {
    var shortenerService: URLShortenerService = PIURLShortenerService()
    
    static let shared = URLShortenerManager()
    private init() {}
    
    func getShortURL(longURL: URL) throws -> URL? {
        do {
            return try shortenerService.getShortURL(longURL: longURL)
        } catch {
            throw URLShortenerError.someError
        }
    }
    
    func getOriginalURL(shortURL: URL) throws -> URL? {
        do {
            return try shortenerService.getOriginalURL(shortURL: shortURL)
        } catch {
            throw URLShortenerError.someError
        }
    }
}
