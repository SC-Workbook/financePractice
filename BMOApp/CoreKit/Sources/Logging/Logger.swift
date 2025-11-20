//
//  Logger.swift
//  BMOApp
//
//  Created by Sahil ChowKekar on 11/20/25.
//

import Foundation

public enum AppLogger {

    public static func info(_ message: String) {
        print("INFO:", message)
    }

    public static func error(_ message: String) {
        print("ERROR:", message)
    }

    public static func debug(_ message: String) {
        #if DEBUG
        print("DEBUG:", message)
        #endif
    }
}

