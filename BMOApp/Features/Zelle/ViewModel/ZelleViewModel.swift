//
//  ZelleViewModel.swift
//  BMOApp
//
//  Created by Sahil ChowKekar on 12/2/25.
//

import Foundation
import Combine

@MainActor
public final class ZelleViewModel: ObservableObject {

    @Published public var recipient: String = ""
    @Published public var amount: String = ""

    @Published public private(set) var isLoading: Bool = false
    @Published public private(set) var errorMessage: String?
    @Published public private(set) var transferResponse: ZelleTransferResponse?

    private let repository: ZelleRepositoryProtocol

    public init(repository: ZelleRepositoryProtocol) {
        self.repository = repository
    }

    public func sendMoney() async {
        guard let amountValue = Double(amount) else {
            errorMessage = "Please enter a valid amount"
            return
        }

        isLoading = true
        errorMessage = nil
        transferResponse = nil

        do {
            let response = try await repository.send(
                amount: amountValue,
                to: recipient
            )
            self.transferResponse = response
        } catch {
            self.errorMessage = error.localizedDescription
        }

        isLoading = false
    }
}
