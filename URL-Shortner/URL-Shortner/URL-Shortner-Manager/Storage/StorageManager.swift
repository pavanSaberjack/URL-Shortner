//
//  StorageManager.swift
//  TinyURL
//
//  Created by Pavan on 04/09/22.
//

import Foundation

enum StorageError: Error {
    case failedToStoreError
    case fetchError
}

protocol StorageService {
    func store(key: String, forValue value: String) throws -> Bool
    func getValue(forKey key: String) throws -> String
    func resetStorage()
}


class StoragaManager: StorageService {
    var storageService: StorageService = LocalStorage()
    
    static let shared = StoragaManager()
    private init() {}
    
    func store(key: String, forValue value: String) throws -> Bool {
        do {
            return try storageService.store(key: key, forValue: value)
        } catch {
            throw StorageError.failedToStoreError
        }
    }
    
    func getValue(forKey key: String) throws -> String {
        do {
            return try storageService.getValue(forKey: key)
        } catch {
            throw StorageError.fetchError
        }
    }
    
    func resetStorage() {
        storageService.resetStorage()
    }
}
