//
//  HomeViewController.swift
//  BMOApp
//
//  Created by Sahil ChowKekar on 12/2/25.
//

import Foundation
import UIKit

final class HomeViewController: UIViewController {

    let onCheckDeposit: () -> Void
    let onZelle: () -> Void
    let onCardControls: () -> Void
    let onAlerts: () -> Void

    init(
        onCheckDeposit: @escaping () -> Void,
        onZelle: @escaping () -> Void,
        onCardControls: @escaping () -> Void,
        onAlerts: @escaping () -> Void
    ) {
        self.onCheckDeposit = onCheckDeposit
        self.onZelle = onZelle
        self.onCardControls = onCardControls
        self.onAlerts = onAlerts
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupUI()
    }

    private func setupUI() {
        let stack = UIStackView(arrangedSubviews: [
            makeButton(title: "Check Deposit", action: onCheckDeposit),
            makeButton(title: "Zelle", action: onZelle),
            makeButton(title: "Card Controls", action: onCardControls),
            makeButton(title: "Alerts", action: onAlerts)
        ])

        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 16
        stack.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(stack)

        NSLayoutConstraint.activate([
            stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    private func makeButton(title: String, action: @escaping () -> Void) -> UIButton {
        var config = UIButton.Configuration.filled()
        config.title = title

        let button = UIButton(configuration: config)
        button.addAction(UIAction { _ in action() }, for: .touchUpInside)

        return button
    }
}
