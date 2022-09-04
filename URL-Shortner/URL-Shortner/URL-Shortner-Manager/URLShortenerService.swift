//
//  URLShortenerService.swift
//  TinyURL
//
//  Created by Pavan on 03/09/22.
//

import Foundation

enum URLShortenerError: Error {
    case someError
}

protocol URLShortenerService {
    func getShortURL(longURL: URL) throws -> URL?
    func getOriginalURL(shortURL: URL) throws -> URL?
}

extension URLShortenerService {
    var baseURL: URL {
        return URL(string: "https://app.diagrams.net/")!
    }
}
