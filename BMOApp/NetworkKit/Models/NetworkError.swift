//
//  NetworkError.swift
//  BMOApp
//
//  Created by Sahil ChowKekar on 11/23/25.
//

import Foundation
import CoreKit

public enum NetworkError: Error {
    case invalidURL
    case serverError(Int)
    case decodingFailed
    case noData
    case unauthorized
    case timeout
    case unknown
}

