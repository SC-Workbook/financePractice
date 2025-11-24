//
//  ZelleRepositoryProtocol.swift
//  BMOApp
//
//  Created by Sahil ChowKekar on 11/24/25.
//

import Foundation

public protocol ZelleRepositoryProtocol {
    func send(amount: Double, to recipient: String) async throws -> ZelleTransferResponse
}
