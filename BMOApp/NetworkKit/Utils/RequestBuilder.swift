//
//  RequestBuilder.swift
//  BMOApp
//
//  Created by Sahil ChowKekar on 11/23/25.
//

import Foundation

public struct RequestBuilder {

    public static func build(
        url: String,
        method: HTTPMethod,
        headers: [String: String] = [:],
        body: Encodable? = nil
    ) throws -> URLRequest {

        guard let url = URL(string: url) else {
            throw NetworkError.invalidURL
        }

        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue

        headers.forEach { key, value in
            request.addValue(value, forHTTPHeaderField: key)
        }

        if let body = body {
            request.httpBody = try JSONEncoder().encode(body)
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        }

        return request
    }
}
