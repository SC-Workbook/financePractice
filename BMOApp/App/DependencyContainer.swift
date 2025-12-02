//
//  DependencyContainer.swift
//  BMOApp
//
//  Created by Sahil ChowKekar on 11/24/25.
//

import Foundation

final class DependencyContainer {

    static let shared = DependencyContainer()

    private init() {}

    // MARK: - Services
    lazy var networkClient = HTTPClient.shared
    lazy var graphQLClient = GraphQLClient()

    // MARK: - Repositories
    func makeCheckDepositRepository() -> CheckDepositRepositoryProtocol {
        CheckDepositRepository()
    }

    func makeZelleRepository() -> ZelleRepositoryProtocol {
        ZelleRepository()
    }

    func makeCardControlsRepository() -> CardControlsRepository {
        CardControlsRepository()
    }

    func makeAlertsRepository() -> AlertsRepositoryProtocol {
        AlertsRepository()
    }

    // MARK: - ViewModels
    func makeCheckDepositVM() -> CheckDepositViewModel {
        CheckDepositViewModel(
            repository: makeCheckDepositRepository()
        )
    }

    func makeZelleVM() -> ZelleViewModel {
        ZelleViewModel(
            repository: makeZelleRepository()
        )
    }

    func makeCardControlsVM() -> CardControlsViewModel {
        CardControlsViewModel(
            repository: makeCardControlsRepository()
        )
    }

    func makeAlertsVM() -> AlertsViewModel {
        AlertsViewModel(
            repository: makeAlertsRepository()
        )
    }
}
