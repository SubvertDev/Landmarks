//
//  UIViewController+Ext.swift
//  LandmarksApp
//
//  Created by Subvert on 3/23/22.
//

import UIKit

extension UIViewController {
    func showAlert(withMessage message: String, completion: (() -> Void)? = nil) {
        let alert = UIAlertController(title: K.Error.whoopsTitle, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: K.Error.okTitle, style: .cancel, handler: { _ in
            completion?()
        }))
        present(alert, animated: true)
    }
}
