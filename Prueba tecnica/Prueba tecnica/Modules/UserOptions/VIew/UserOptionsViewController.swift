//
//  UserOptionsViewController.swift
//  Prueba tecnica
//
//  Created by Javier Vazquez on 04/10/20.
//  Copyright © 2020 GDG UNAM. All rights reserved.
//

import UIKit

class UserOptionsViewController: BaseViewController {

    @IBOutlet private weak var userOptionsTableView: UITableView!
    @IBOutlet private weak var goToOptionsDetailsButton: UIButton!
    
    var presenter = UserOptionsPresenter()
    
    let heightOfRow: CGFloat = 45
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureTableView()
    }

    func configureUI() {
        navigationItem.title = "USER_OPTIONS_TITLE".localized
        goToOptionsDetailsButton.setBorderRoundStyle(color: .red)
    }
    
    func configureTableView() {
        userOptionsTableView.dataSource = self
        userOptionsTableView.delegate = self
        userOptionsTableView.tableFooterView = UIView()
    }

    @IBAction func onClickGoToOptionsDetails(_ sender: Any) {
        let optionList = presenter.userOptionsList.filter({ $0.isEnabled == true})
        if optionList.isEmpty {
            showAlertController(title: "ERROR".localized, message: "CHOICE_OPTION".localized)
        }
        else {
            let optionDetailVC = UserEditablesViewController()
            optionDetailVC.configure(optionList: presenter.userOptionsList)
            optionDetailVC.modalPresentationStyle = .overFullScreen
            navigationController?.pushViewController(optionDetailVC, animated: true)
        }
    }
}

extension UserOptionsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.userOptionsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.accessoryType = presenter.userOptionsList[indexPath.row].isEnabled ? .checkmark : .none
        cell.tintColor = .red
        cell.textLabel?.text = presenter.userOptionsList[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter.userOptionsList[indexPath.row].isEnabled = presenter.userOptionsList[indexPath.row].isEnabled ? false : true
        tableView.reloadSections(IndexSet(0..<tableView.numberOfSections), with: .fade)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return heightOfRow
    }
    
}
