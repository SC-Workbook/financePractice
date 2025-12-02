//
//  CardControlsRepositoryProtocol.swift
//  BMOApp
//
//  Created by Sahil ChowKekar on 11/24/25.
//

import Foundation

public protocol CardControlsRepositoryProtocol {
    func toggleCard()
}

public final class CardControlsRepository: CardControlsRepositoryProtocol {
    public init() {}
    public func toggleCard() {
        // TODO: Implement real toggle
    }
}

