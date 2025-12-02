//
//  CardControlsView.swift
//  BMOApp
//
//  Created by Sahil ChowKekar on 12/2/25.
//

import SwiftUI

public struct CardControlsView: View {

    @StateObject private var vm: CardControlsViewModel

    public init(viewModel: CardControlsViewModel) {
        _vm = StateObject(wrappedValue: viewModel)
    }

    public var body: some View {
        VStack(spacing: 24) {

            Text("Card Controls")
                .font(.title)
                .bold()

            Text(vm.status.isLocked ? "Card is Locked" : "Card is Active")
                .font(.headline)
                .foregroundColor(vm.status.isLocked ? .red : .green)

            if vm.isLoading {
                ProgressView()
            }

            Button(action: {
                Task { await vm.toggle() }
            }) {
                Text(vm.status.isLocked ? "Unlock Card" : "Lock Card")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(vm.status.isLocked ? Color.green : Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
        }
        .padding()
        .alert("Error", isPresented: .constant(vm.errorMessage != nil)) {
        } message: {
            Text(vm.errorMessage ?? "")
        }
    }
}

//#Preview {
//    CardControlsView()
//}
