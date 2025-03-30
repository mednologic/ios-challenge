//
//  AlertPresenter.swift
//  iOS-Challenge
//
//  Created by josepL on 29/3/25.
//

import UIKit

/// Optional bonus: Alerts for the system
final class AlertPresenter {
    static func showAlert(title: String, message: String,
                          buttonTitle: String = "OK".localized, dismissHandler: (() -> Void)? = nil) {
        DispatchQueue.main.async {
            guard let topViewController = AlertPresenter.topMostViewController() else { return }

            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: buttonTitle, style: .default) { _ in
                dismissHandler?()
            }

            alert.addAction(okAction)

            topViewController.present(alert, animated: true, completion: nil)
        }
    }

    private static func topMostViewController() -> UIViewController? {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let keyWindow = windowScene.windows.first(where: { $0.isKeyWindow }) else {
            return nil
        }

        var topController = keyWindow.rootViewController
        while let presentedViewController = topController?.presentedViewController {
            topController = presentedViewController
        }
        return topController
    }
}
