//
//  HomeViewController.swift
//  iOS-Challenge
//
//  Created by josepL on 29/3/25.
//

import UIKit
import SwiftUI

final class HomeViewController: UIViewController {
    private let repository: PropietiesDataRepositoryProtocol

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @IBOutlet weak var ListView: UIView!

    init(repository: PropietiesDataRepositoryProtocol) {
        self.repository = repository
        super.init(nibName: "Home", bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = DesignSystem.Colors.backgroundUIColor
        setUpTitleLabel()
        setUpListView()
    }

    private func setUpTitleLabel() {
        let titleLabel = UILabel()
        titleLabel.text = "WELCOME_HOME_TITLE".localized
        titleLabel.applyTitleStyle()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(titleLabel)

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: DesignSystem.Spacing.m),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    private func setUpListView() {
        let viewModel = PropertyListViewModel(repository: repository)
        let swiftUIView = PropertyListView(viewModel: viewModel)

        let hostingController = UIHostingController(rootView: swiftUIView)
        addChild(hostingController)
        hostingController.view.frame = ListView.bounds
        hostingController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        ListView.addSubview(hostingController.view)
        hostingController.didMove(toParent: self)
    }
}
