//
//  AuthInterceptor.swift
//  BMOApp
//
//  Created by Sahil ChowKekar on 11/23/25.
//

import Foundation

public protocol AuthInterceptor {
    func attachAuthHeaders(to request: inout URLRequest)
    func handleUnauthorized() async
}

public final class DefaultAuthInterceptor: AuthInterceptor {

    public init() {}

    public func attachAuthHeaders(to request: inout URLRequest) {
        request.addValue("Bearer abc123", forHTTPHeaderField: "Authorization")
    }

    public func handleUnauthorized() async {
        // refresh token logic, or logout user
    }
}

