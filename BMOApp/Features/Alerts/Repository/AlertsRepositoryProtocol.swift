//
//  AlertsRepositoryProtocol.swift
//  BMOApp
//
//  Created by Sahil ChowKekar on 11/24/25.
//

import Foundation

public protocol AlertsRepositoryProtocol {
    func fetchAlerts() async throws -> [AlertItem]
}
