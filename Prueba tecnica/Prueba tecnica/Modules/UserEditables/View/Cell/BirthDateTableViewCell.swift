//
//  BirthDateTableViewCell.swift
//  Prueba tecnica
//
//  Created by Javier Vazquez on 05/10/20.
//

import UIKit

class BirthDateTableViewCell: UITableViewCell {

    @IBOutlet private weak var birthDateTextField: UITextField!
    
    let dateFormat = "dd/MM/yyyy"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initDatePicker()
        birthDateTextField.placeholder = "BIRTHDATE".localized
        birthDateTextField.borderStyle = .roundedRect
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func initDatePicker(){
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.maximumDate = Date()
        datePicker.addTarget(self, action: #selector(dateChanged(datePicker:)), for: .valueChanged)
        birthDateTextField.inputView = datePicker
        birthDateTextField.addDoneCancelToolbar()
    }
    
    @objc func dateChanged(datePicker: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        birthDateTextField.text = dateFormatter.string(from: datePicker.date)
    }
}
