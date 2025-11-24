//
//  NetworkCache.swift
//  BMOApp
//
//  Created by Sahil ChowKekar on 11/23/25.
//

import Foundation

public actor NetworkCache {
    private var storage: [String: Data] = [:]

    public func get(for key: String) -> Data? {
        storage[key]
    }

    public func set(_ data: Data, for key: String) {
        storage[key] = data
    }
}
