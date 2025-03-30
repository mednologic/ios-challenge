//
//  HomeViewController.swift
//  iOS-Challenge
//
//  Created by josepL on 29/3/25.
//

import SwiftUI

final class HomeViewController: UIViewController {
    private let repository: PropietiesDataRepositoryProtocol

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @IBOutlet weak var ListViewContainer: UIView!

    init(repository: PropietiesDataRepositoryProtocol) {
        self.repository = repository
        super.init(nibName: "Home", bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = DesignSystem.Colors.backgroundUIColor
        setUpListView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    private func setUpListView() {
        let viewModel = PropertyListViewModel(repository: repository)
        let swiftUIView = PropertyListView(viewModel: viewModel)

        let hostingController = UIHostingController(rootView: swiftUIView)
        addChild(hostingController)
        hostingController.view.frame = ListViewContainer.bounds
        hostingController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        ListViewContainer.addSubview(hostingController.view)
        hostingController.didMove(toParent: self)
    }
}
