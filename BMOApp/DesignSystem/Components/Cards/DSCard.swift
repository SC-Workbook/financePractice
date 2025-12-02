//
//  DSCard.swift
//  BMOApp
//
//  Created by Sahil ChowKekar on 11/24/25.
//

import Foundation
import SwiftUI

public struct DSCard<Content: View>: View {

    private let content: Content

    public init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    public var body: some View {
        content
            .padding()
//            .background(DSColor.background)
            .cornerRadius(12)
            .dsShadow()
    }
}
