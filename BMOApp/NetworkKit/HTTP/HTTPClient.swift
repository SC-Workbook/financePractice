//
//  HTTPClient.swift
//  BMOApp
//
//  Created by Sahil ChowKekar on 11/23/25.
//

import Foundation
//import CoreKit

public final class HTTPClient {

    public static let shared = HTTPClient()

    private let session: URLSession
    private let cache = NetworkCache()
    private var interceptor: AuthInterceptor?

    public init(
        session: URLSession = .shared,
        interceptor: AuthInterceptor? = DefaultAuthInterceptor()
    ) {
        self.session = session
        self.interceptor = interceptor
    }

    public func request<T: Decodable>(
        _ request: URLRequest,
        cacheKey: String? = nil,
        retry: Int = 1
    ) async throws -> T {

        var request = request
        interceptor?.attachAuthHeaders(to: &request)

        // Check cache
        if let key = cacheKey, let cached = await cache.get(for: key) {
            return try JSONDecoder().decode(T.self, from: cached)
        }

        do {
            let (data, response) = try await session.data(for: request)

            guard let http = response as? HTTPURLResponse else {
                throw NetworkError.unknown
            }

            switch http.statusCode {
            case 200..<300:
                if let key = cacheKey { await cache.set(data, for: key) }
                return try JSONDecoder().decode(T.self, from: data)

            case 401:
                await interceptor?.handleUnauthorized()
                throw NetworkError.unauthorized

            default:
                throw NetworkError.serverError(http.statusCode)
            }

        } catch {
//            if retry > 0 {
//                return try await request(request, cacheKey: cacheKey, retry: retry - 1)
//            }
            throw NetworkError.unknown
        }
    }
}

