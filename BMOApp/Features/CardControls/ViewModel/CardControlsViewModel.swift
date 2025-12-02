//
//  CardControlsViewModel.swift
//  BMOApp
//
//  Created by Sahil ChowKekar on 12/2/25.
//

import Foundation
import Combine

@MainActor
public final class CardControlsViewModel: ObservableObject {

    @Published public private(set) var status: CardStatus = .init(isLocked: false)
    @Published public private(set) var isLoading: Bool = false
    @Published public private(set) var errorMessage: String?

    private let repository: CardControlsRepositoryProtocol

    public init(repository: CardControlsRepositoryProtocol) {
        self.repository = repository
    }

    public func toggle() async {
        isLoading = true
        errorMessage = nil

        do {
            // Simulate API latency
            try await Task.sleep(nanoseconds: 500_000_000)

            // Toggle state locally for demo
            status = CardStatus(isLocked: !status.isLocked)

            // Call repository method
            repository.toggleCard()

        } catch {
            errorMessage = error.localizedDescription
        }

        isLoading = false
    }
}

