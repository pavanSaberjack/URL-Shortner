//
//  TokenService.swift
//  TinyURL
//
//  Created by Pavan on 04/09/22.
//

import Foundation

protocol TokenService {
    func getTokensList() throws -> [String]
}

extension TokenService {
    var numberOfURLsToSupport: Int {
        return numberOfRequestsPerSec * 60 * 60 * 24 * timePeriodToSupport
    }
    
    var numberOfRequestsPerSec: Int {
        // As it is local library setting it to 1
        return 1
    }
    
    var timePeriodToSupport: Int {
        // Default to 30 day
        return 30
    }
    
    var allowedCharacters: CharacterSet {
        return CharacterSet.alphanumerics
    }
}

