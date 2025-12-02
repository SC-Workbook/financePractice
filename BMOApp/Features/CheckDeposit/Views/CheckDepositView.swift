//
//  CheckDepositView.swift
//  BMOApp
//
//  Created by Sahil ChowKekar on 11/24/25.
//

import Foundation
import SwiftUI
//import DesignSystem

public struct CheckDepositView: View {

    @StateObject private var vm = CheckDepositViewModel()

    public init() {}

    public var body: some View {
        VStack(spacing: DSSpacing.md) {
            DSPrimaryButton(title: "Submit Check") {
                Task {
                    await vm.submit(imageData: Data())  // replace with real camera flow
                }
            }

            if let result = vm.result {
                Text("Deposit ID: \(result.depositId)")
                    .font(DSTypography.body)
            }
        }
        .padding(DSSpacing.md)
    }
}
