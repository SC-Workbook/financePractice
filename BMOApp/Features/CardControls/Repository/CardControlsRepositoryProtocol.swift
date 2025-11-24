//
//  CardControlsRepositoryProtocol.swift
//  BMOApp
//
//  Created by Sahil ChowKekar on 11/24/25.
//

import Foundation

public protocol CardControlsRepositoryProtocol {
    func toggleLock() async throws -> CardStatus
}
