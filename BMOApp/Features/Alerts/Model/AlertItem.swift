//
//  AlertItem.swift
//  BMOApp
//
//  Created by Sahil ChowKekar on 11/24/25.
//

import Foundation

public struct AlertItem: Decodable, Identifiable {
    public let id: String
    public let message: String
}
