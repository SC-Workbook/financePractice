//
//  ShadowModifier.swift
//  BMOApp
//
//  Created by Sahil ChowKekar on 11/24/25.
//

import Foundation
import SwiftUI

public struct ShadowModifier: ViewModifier {
    public func body(content: Content) -> some View {
        content.shadow(color: .black.opacity(0.1),
                       radius: 4, x: 0, y: 2)
    }
}

public extension View {
    func dsShadow() -> some View {
        self.modifier(ShadowModifier())
    }
}
