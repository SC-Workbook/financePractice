//
//  CryptoHelper.swift
//  BMOApp
//
//  Created by Sahil ChowKekar on 11/20/25.
//

import CryptoKit
import Foundation

public struct CryptoHelper {

    public static func sha256(_ text: String) -> String {
        let digest = SHA256.hash(data: Data(text.utf8))
        return digest.map { String(format: "%02hhx", $0) }.joined()
    }
}

