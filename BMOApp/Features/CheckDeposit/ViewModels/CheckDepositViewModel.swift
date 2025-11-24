//
//  CheckDepositViewModel.swift
//  BMOApp
//
//  Created by Sahil ChowKekar on 11/24/25.
//

import Foundation
import Combine

@MainActor
public final class CheckDepositViewModel: ObservableObject {

    @Published public var result: DepositResult?
    @Published public var isLoading = false

    private let repository: CheckDepositRepositoryProtocol

    public init(repository: CheckDepositRepositoryProtocol = CheckDepositRepository()) {
        self.repository = repository
    }

    public func submit(imageData: Data) async {
        isLoading = true
        do {
            let base64 = imageData.base64EncodedString()
            result = try await repository.submitCheck(imageBase64: base64)
        } catch {
            print("Deposit failed:", error)
        }
        isLoading = false
    }
}
