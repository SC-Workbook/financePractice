//
//  DSPrimaryButton.swift
//  BMOApp
//
//  Created by Sahil ChowKekar on 11/24/25.
//

import Foundation
import SwiftUI

public struct DSPrimaryButton: View {
    
    private let title: String
    private let action: () -> Void

    public init(title: String, action: @escaping () -> Void) {
        self.title = title
        self.action = action
    }

    public var body: some View {
        Button(action: action) {
            Text(title)
                .font(DSTypography.body)
                .padding()
                .frame(maxWidth: .infinity)
                .foregroundColor(.white)
//                .background(DSColor.primary)
                .cornerRadius(10)
        }
    }
}
