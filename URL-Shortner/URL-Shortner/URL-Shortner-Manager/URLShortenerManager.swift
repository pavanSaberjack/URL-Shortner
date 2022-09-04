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
        var shortURL: URL?
        do {
            shortURL = try shortenerService.getShortURL(longURL: longURL)
            return shortURL
        } catch {
            throw URLShortenerError.someError
        }
    }
    
    func getOriginalURL(shortURL: URL) throws -> URL? {
        var originalURL: URL?
        do {
            originalURL = try shortenerService.getOriginalURL(shortURL: shortURL)
            return originalURL
        } catch {
            throw URLShortenerError.someError
        }
    }
}
