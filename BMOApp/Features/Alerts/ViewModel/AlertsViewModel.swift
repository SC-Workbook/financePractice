//
//  AlertsViewModel.swift
//  BMOApp
//
//  Created by Sahil ChowKekar on 12/2/25.
//

import Foundation
import Combine

@MainActor
public final class AlertsViewModel: ObservableObject {

    @Published public private(set) var alerts: [AlertItem] = []
    @Published public private(set) var isLoading: Bool = false
    @Published public private(set) var errorMessage: String?

    private let repository: AlertsRepositoryProtocol

    public init(repository: AlertsRepositoryProtocol) {
        self.repository = repository
    }

    public func loadAlerts() async {
        isLoading = true
        errorMessage = nil

        do {
            let items = try await repository.fetchAlerts()
            self.alerts = items
        } catch {
            self.errorMessage = error.localizedDescription
        }

        isLoading = false
    }
}

