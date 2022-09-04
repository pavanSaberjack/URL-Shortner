//
//  TokenManager.swift
//  TinyURL
//
//  Created by Pavan on 04/09/22.
//

import Foundation

enum TokenGeneratorError: Error {
    case tokenError
}

class TokenManager: TokenService {
    static let shared = TokenManager()
    private init() {}
    
    var tokenGenerator: TokenService = TokenGenerator()
    func getTokensList() throws -> [String] {
        do {
            return try tokenGenerator.getTokensList()
        } catch {
            throw error
        }
    }
}
