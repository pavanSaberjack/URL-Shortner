//
//  PIURLShortenerService.swift
//  TinyURL
//
//  Created by Pavan on 04/09/22.
//

import Foundation

class PIURLShortenerService: URLShortenerService {
    var tokens: [String] = []
    
    func getShortURL(longURL: URL) throws -> URL? {
        if tokens.isEmpty {
            do {
                let tokenList = try TokenManager.shared.getTokensList()
                tokens.append(contentsOf: tokenList)
            } catch {
                print("Tokens not available")
                throw URLShortenerError.someError
            }
        }
        
        guard let token = tokens.last else {
            throw URLShortenerError.someError
        }
        
        let shortURLString = baseURL.absoluteString.appending(token)
        
        do {
            if try StoragaManager.shared.store(key: shortURLString, forValue: longURL.absoluteString) {
                tokens.removeLast()
                return URL(string: shortURLString)
            }
            throw URLShortenerError.someError
        } catch {
            throw URLShortenerError.someError
        }
    }
    
    func getOriginalURL(shortURL: URL) throws -> URL? {
        // fetch from core data and return the url
        do {
            let urlString = try StoragaManager.shared.getValue(forKey: shortURL.absoluteString)
            return URL(string: urlString)
        } catch {
            throw URLShortenerError.someError
        }
    }
}
