//
//  CheckDepositRepositoryProtocol.swift
//  BMOApp
//
//  Created by Sahil ChowKekar on 11/24/25.
//

import Foundation

public protocol CheckDepositRepositoryProtocol {
    func submitCheck(imageBase64: String) async throws -> DepositResult
}
