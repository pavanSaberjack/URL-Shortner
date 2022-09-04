//
//  LocalStorageService.swift
//  TinyURL
//
//  Created by Pavan on 04/09/22.
//

import Foundation

class LocalStorage: StorageService {
    private var storage: [String: String] = [:]
    
    func store(key: String, forValue value: String) throws -> Bool {
        storage[key] = value
        return true
    }
    
    func getValue(forKey key: String) throws -> String {
        guard let val = storage[key] else {
            throw StorageError.fetchError
        }
        return val
    }
    
    func resetStorage() {
        storage = [:]
    }
}
