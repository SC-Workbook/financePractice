//
//  AppCoordinator.swift
//  BMOApp
//
//  Created by Sahil ChowKekar on 11/24/25.
//

import Foundation
import UIKit
import FeatureCheckDeposit
import FeatureZelle
import FeatureCardControls
import FeatureAlerts

public protocol Coordinator: AnyObject {
    var navigationController: UINavigationController { get }
    func start()
}
 

final class AppCoordinator: Coordinator {

    let navigationController: UINavigationController
    private let container: DependencyContainer

    init(navigationController: UINavigationController,
         container: DependencyContainer = .shared) {
        self.navigationController = navigationController
        self.container = container
    }

    func start() {
        showHome()
    }

    private func showHome() {
        let homeVC = HomeViewController(
            onCheckDeposit: { [weak self] in self?.startCheckDepositFlow() },
            onZelle:        { [weak self] in self?.startZelleFlow() },
            onCardControls: { [weak self] in self?.startCardControlsFlow() },
            onAlerts:       { [weak self] in self?.startAlertsFlow() }
        )

        navigationController.setViewControllers([homeVC], animated: false)
    }
}

extension AppCoordinator {

    func startCheckDepositFlow() {
        let coordinator = CheckDepositCoordinator(
            navigationController: navigationController,
            container: container
        )
        coordinator.start()
    }

    func startZelleFlow() {
        let coordinator = ZelleCoordinator(
            navigationController: navigationController,
            container: container
        )
        coordinator.start()
    }

    func startCardControlsFlow() {
        let coordinator = CardControlsCoordinator(
            navigationController: navigationController,
            container: container
        )
        coordinator.start()
    }

    func startAlertsFlow() {
        let coordinator = AlertsCoordinator(
            navigationController: navigationController,
            container: container
        )
        coordinator.start()
    }
}
