//
//  GraphQLClient.swift
//  BMOApp
//
//  Created by Sahil ChowKekar on 11/23/25.
//

import Foundation

public final class GraphQLClient {

    private let http = HTTPClient.shared

    public init() {}

    public func execute<T: Decodable>(_ query: String) async throws -> T {

        let request = try RequestBuilder.build(
            url: "https://api.bank.com/graphql",
            method: .post,
            headers: ["Content-Type": "application/json"],
            body: ["query": query]
        )

        return try await http.request(request)
    }
}

