//
//  AlertsView.swift
//  BMOApp
//
//  Created by Sahil ChowKekar on 12/2/25.
//

import SwiftUI

public struct AlertsView: View {

    @StateObject private var vm: AlertsViewModel

    public init(viewModel: AlertsViewModel) {
        _vm = StateObject(wrappedValue: viewModel)
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 16) {

            Text("Alerts")
                .font(.title)
                .bold()

            if vm.isLoading {
                ProgressView("Loading Alerts...")
            }
            else if let error = vm.errorMessage {
                Text("Error: \(error)")
                    .foregroundColor(.red)
            }
            else if vm.alerts.isEmpty {
                Text("No Alerts Found")
                    .foregroundColor(.secondary)
            }
            else {
                List(vm.alerts) { alert in
                    VStack(alignment: .leading, spacing: 4) {
                        Text(alert.id)
                            .font(.caption)
                            .foregroundColor(.secondary)

                        Text(alert.message)
                            .font(.body)
                    }
                    .padding(.vertical, 4)
                }
            }
        }
        .padding()
        .task {
            await vm.loadAlerts()
        }
    }
}


//#Preview {
//    AlertsView()
//}
