//
//  CheckDepositRepository.swift
//  BMOApp
//
//  Created by Sahil ChowKekar on 11/24/25.
//

import Foundation
//import NetworkKit
import CoreKit

public final class CheckDepositRepository: CheckDepositRepositoryProtocol {

    public init() {}

    public func submitCheck(imageBase64: String) async throws -> DepositResult {
        let request = try RequestBuilder.build(
            url: "https://api.bank.com/deposit",
            method: .post,
            body: ["image": imageBase64]
        )

        return try await HTTPClient.shared.request(request)
    }
}
