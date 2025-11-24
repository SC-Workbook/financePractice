//
//  CheckDepositCoordinator.swift
//  BMOApp
//
//  Created by Sahil ChowKekar on 11/24/25.
//

import Foundation
import UIKit
import SwiftUI
import FeatureCheckDeposit

final class CheckDepositCoordinator: Coordinator {

    let navigationController: UINavigationController
    let container: DependencyContainer

    init(navigationController: UINavigationController,
         container: DependencyContainer) {
        self.navigationController = navigationController
        self.container = container
    }

    func start() {
        let vm = container.makeCheckDepositVM()
        let view = CheckDepositView(viewModel: vm)

        let vc = UIHostingController(rootView: view)
        navigationController.pushViewController(vc, animated: true)
    }
}
