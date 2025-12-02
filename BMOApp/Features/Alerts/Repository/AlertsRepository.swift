//
//  AlertsRepository.swift
//  BMOApp
//
//  Created by Sahil ChowKekar on 11/24/25.
//

import Foundation

public protocol AlertsRepositoryProtocol {
    func fetchAlerts() async throws -> [AlertItem]
}

public final class AlertsRepository: AlertsRepositoryProtocol {

    public init() {}

    public func fetchAlerts() async throws -> [AlertItem] {
        // Simulated network or local JSON
        return [
            AlertItem(id: "1", message: "Login from a new device detected."),
            AlertItem(id: "2", message: "Your checking account balance is low."),
            AlertItem(id: "3", message: "A large transaction was made on your card.")
        ]
    }
}



