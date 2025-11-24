//
//  AlertsRepository.swift
//  BMOApp
//
//  Created by Sahil ChowKekar on 11/24/25.
//

import Foundation

public final class AlertsRepository: AlertsRepositoryProtocol {

    public init() {}

    public func fetchAlerts() async throws -> [AlertItem] {
        let request = try RequestBuilder.build(
            url: "https://api.bank.com/alerts",
            method: .get
        )
        return try await HTTPClient.shared.request(request)
    }
}
