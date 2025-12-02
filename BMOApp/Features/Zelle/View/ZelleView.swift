//
//  ZelleView.swift
//  BMOApp
//
//  Created by Sahil ChowKekar on 12/2/25.
//

import SwiftUI

public struct ZelleView: View {

    @StateObject private var vm: ZelleViewModel

    public init(viewModel: ZelleViewModel) {
        _vm = StateObject(wrappedValue: viewModel)
    }

    public var body: some View {
        VStack(spacing: 24) {

            Text("Send Money with Zelle")
                .font(.title)
                .bold()

            TextField("Recipient email or phone", text: $vm.recipient)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)

            TextField("Amount", text: $vm.amount)
                .keyboardType(.decimalPad)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal)

            if vm.isLoading {
                ProgressView("Sending…")
            }

            Button(action: {
                Task { await vm.sendMoney() }
            }) {
                Text("Send Money")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
            .padding(.horizontal)

            if let response = vm.transferResponse {
                VStack(spacing: 8) {
                    Text("Transfer Successful!")
                        .font(.headline)
                        .foregroundColor(.green)

                    Text("Transfer ID: \(response.transferId)")
                    Text("Status: \(response.status)")
                }
                .padding()
            }

            if let error = vm.errorMessage {
                Text(error)
                    .foregroundColor(.red)
                    .padding(.top)
            }

            Spacer()
        }
        .padding(.top, 20)
    }
}


//#Preview {
//    ZelleView()
//}
