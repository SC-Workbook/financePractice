//
//  AppError.swift
//  BMOApp
//
//  Created by Sahil ChowKekar on 11/20/25.
//

import Foundation

public enum AppError: Error {
    case invalidRequest
    case decodingFailed
    case networkUnavailable
    case timeout
    case unauthorized
    case unknown
}

