//
//  ZelleRepository.swift
//  BMOApp
//
//  Created by Sahil ChowKekar on 11/24/25.
//

import Foundation

public final class ZelleRepository: ZelleRepositoryProtocol {

    public init() {}

    public func send(amount: Double, to recipient: String) async throws -> ZelleTransferResponse {
        let request = try RequestBuilder.build(
            url: "https://api.bank.com/zelle/send",
            method: .post,
//            body: ["amount": amount, "recipient": recipient]
        )

        return try await HTTPClient.shared.request(request)
    }
}
