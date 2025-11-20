//
//  Date+Extensions.swift
//  BMOApp
//
//  Created by Sahil ChowKekar on 11/20/25.
//

import Foundation

public extension Date {

    func formatted(_ format: String = "yyyy-MM-dd HH:mm:ss") -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}

