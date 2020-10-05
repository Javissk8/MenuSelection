//
//  BaseViewController.swift
//  Prueba tecnica
//
//  Created by Javier Vazquez on 04/10/20.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.tintColor = .red
    }

    func showAlertController(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK".localized, style: UIAlertAction.Style.default))
        alert.view.tintColor = .red
        present(alert, animated: true)
    }
}
