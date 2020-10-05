//
//  UserEditablesViewController.swift
//  Prueba tecnica
//
//  Created by Javier Vazquez on 04/10/20.
//

import UIKit

class UserEditablesViewController: BaseViewController {
    
    private enum SectionType: Int {
        case camera = 0
        case photo
        case fullName
        case phoneNumber
        case birthDate
        case gender
        case favouriteColors
        
        func rowheight() -> CGFloat {
            switch self {
            case .camera, .photo:
                return 150
            case .fullName, .phoneNumber, .birthDate:
                return 100
            case .gender, .favouriteColors:
                return 45
            }
        }
        
        func numberOfRowsInSection(colorList: [ColorOption], genders: [Gender]) -> Int {
            switch self {
            case .camera, .photo, .fullName, .phoneNumber, .birthDate:
                return 1
            case .gender:
                return genders.count
            case .favouriteColors:
                return colorList.count
            }
        }

    }
    
    @IBOutlet private weak var optionsDetailsTableView: UITableView!
    
    var presenter = UserEditablesPresenter()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    func configure(optionList: [UserOption]) {
        presenter.userOptionsList = optionList
    }
    
    func configureTableView() {
        optionsDetailsTableView.dataSource = self
        optionsDetailsTableView.delegate = self
        optionsDetailsTableView.tableFooterView = UIView()
        optionsDetailsTableView.register(UINib(nibName: ImageViewTableViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: ImageViewTableViewCell.reuseIdentifier)
        optionsDetailsTableView.register(UINib(nibName: FullNameTableViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: FullNameTableViewCell.reuseIdentifier)
        optionsDetailsTableView.register(UINib(nibName: BirthDateTableViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: BirthDateTableViewCell.reuseIdentifier)
        optionsDetailsTableView.register(UINib(nibName: PhoneNumberTableViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: PhoneNumberTableViewCell.reuseIdentifier)
    }

}

extension UserEditablesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let tableSection = SectionType(rawValue: section) else { return 0 }
        return tableSection.numberOfRowsInSection(colorList: presenter.colorOptions, genders: presenter.genders)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = UITableViewCell()

        guard let section = SectionType(rawValue: indexPath.section) else { return cell }
        
        switch section {
        case .camera:
            guard let cameraCell = tableView.dequeueReusableCell(withIdentifier: ImageViewTableViewCell.reuseIdentifier) as? ImageViewTableViewCell else { return cell }
            cameraCell.configureCameraCell(cameraImage: presenter.cameraImage)
            cameraCell.delegate = self
            cell = cameraCell
        case .photo:
            guard let photoCell = tableView.dequeueReusableCell(withIdentifier: ImageViewTableViewCell.reuseIdentifier) as? ImageViewTableViewCell else { return cell }
            photoCell.configureWithUrl(url: presenter.imageUrl)
            photoCell.delegate = self
            cell = photoCell
        case .fullName:
            guard let fullNameCell = tableView.dequeueReusableCell(withIdentifier: FullNameTableViewCell.reuseIdentifier) as? FullNameTableViewCell else { return cell }
            cell = fullNameCell
        case .phoneNumber:
            guard let phoneCell = tableView.dequeueReusableCell(withIdentifier: PhoneNumberTableViewCell.reuseIdentifier) as? PhoneNumberTableViewCell else { return cell }
            cell = phoneCell
        case .birthDate:
            guard let birthDateCell = tableView.dequeueReusableCell(withIdentifier: BirthDateTableViewCell.reuseIdentifier) as? BirthDateTableViewCell else { return cell }
            cell = birthDateCell
        case .gender:
            cell.accessoryType = presenter.showCheckMarkIndex == indexPath.row ? .checkmark : .none
            cell.tintColor = .red
            cell.textLabel?.text = presenter.genders[indexPath.row].name
        case .favouriteColors:
            cell.accessoryType = presenter.colorOptions[indexPath.row].isEnabled ? .checkmark : .none
            cell.tintColor = presenter.colorOptions[indexPath.row].color
            cell.textLabel?.text = presenter.colorOptions[indexPath.row].name
        }
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter.userOptionsList.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if presenter.userOptionsList[section].isEnabled {
            return 55
        }
        else {
            return .zero
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let tableSection = SectionType(rawValue: indexPath.section) else { return }
        switch tableSection {
        case .camera, .photo, .fullName, .phoneNumber, .birthDate:
            tableView.deselectRow(at: indexPath, animated: true)
            break
        case .gender:
            presenter.showCheckMarkIndex = indexPath.row
            tableView.reloadSections(IndexSet(tableView.numberOfSections-2..<tableView.numberOfSections-1), with: .fade)
        case .favouriteColors:
            presenter.colorOptions[indexPath.row].isEnabled = presenter.colorOptions[indexPath.row].isEnabled ? false : true
            tableView.reloadSections(IndexSet(tableView.numberOfSections-1..<tableView.numberOfSections), with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if presenter.userOptionsList[indexPath.section].isEnabled {
            guard let tableSection = SectionType(rawValue: indexPath.section) else { return .zero }
            return tableSection.rowheight()
        }
        else {
            return .zero
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if presenter.userOptionsList[section].isEnabled {
            return createHeaderView(title: presenter.userOptionsList[section].name)
        }
        else {
            return UIView()
        }
    }
    
    func createHeaderView(title: String) -> UIView {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 55))
        headerView.backgroundColor = .systemGroupedBackground
        let headerLabel = UILabel()
        headerLabel.font = .systemFont(ofSize: 15, weight: .semibold)
        headerLabel.textColor = .gray
        headerLabel.textAlignment = .left
        headerLabel.text = title
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerView.addSubview(headerLabel)
        headerLabel.leftAnchor.constraint(equalTo: headerView.leftAnchor, constant: 15).isActive = true
        headerLabel.rightAnchor.constraint(equalTo: headerView.rightAnchor).isActive = true
        headerLabel.centerYAnchor.constraint(equalTo: headerView.centerYAnchor, constant: 2).isActive = true
        headerLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        return headerView
    }
}

extension UserEditablesViewController: ImageViewTableViewCellDelegate {
    func didTakePhoto() {
        
        if !UIImagePickerController.isSourceTypeAvailable(.camera) {
            showAlertController(title: "PHOTO_ERROR".localized, message: "CAMERA_UNAVAILABLE".localized)
        }
        else {
            let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
            let cancel = UIAlertAction(title: "CANCEL".localized, style: .cancel, handler: nil)
            let camera = UIAlertAction(title: "TAKE_PHOTO".localized, style: .default) { action in
                let image = UIImagePickerController()
                image.delegate = self
                image.sourceType = UIImagePickerController.SourceType.camera
                image.allowsEditing = false
                self.present(image, animated: true)
            }
            actionSheet.addAction(cancel)
            actionSheet.addAction(camera)
            present(actionSheet,animated: true, completion: nil)
        }
    }
}

extension UserEditablesViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            presenter.cameraImage = image
            self.dismiss(animated: true, completion: nil)
            optionsDetailsTableView.reloadSections(IndexSet(integer: 0), with: .fade)
        }
        else{
            showAlertController(title: "PHOTO_ERROR".localized, message: "CANT_GET_PHOTO".localized)
        }
    }
}
