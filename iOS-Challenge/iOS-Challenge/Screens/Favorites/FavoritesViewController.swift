//
//  FavoritesViewController.swift
//  iOS-Challenge
//
//  Created by josepL on 29/3/25.
//

import SwiftUI

final class FavoritesViewController: UIViewController {
    @IBOutlet var favoritesListContainer: UIView!

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init() {
        super.init(nibName: "Favorites", bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = DesignSystem.Colors.backgroundUIColor
        setUpFavoritesList()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    private func setUpFavoritesList() {
        let viewModel = FavoritesListViewModel()
        let swiftUIView = FavoritesListView(viewModel: viewModel)

        let hostingController = UIHostingController(rootView: swiftUIView)
        addChild(hostingController)
        hostingController.view.frame = favoritesListContainer.bounds
        hostingController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        favoritesListContainer.addSubview(hostingController.view)
        hostingController.didMove(toParent: self)
    }
}
