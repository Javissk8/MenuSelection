//
//  PhoneNumberTableViewCell.swift
//  Prueba tecnica
//
//  Created by Javier Vazquez on 05/10/20.
//  Copyright © 2020 GDG UNAM. All rights reserved.
//

import UIKit

class PhoneNumberTableViewCell: UITableViewCell {

    @IBOutlet private  weak var phoneTextField: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        phoneTextField.keyboardType = .phonePad
        phoneTextField.placeholder = "PHONE_NUMBER".localized
        phoneTextField.borderStyle = .roundedRect
        phoneTextField.delegate = self
        hideKeyboardWhenTappingAround()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

extension PhoneNumberTableViewCell: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text, let stringRange = Range(range, in: text) else { return true }
        
        let updatedText = text.replacingCharacters(in: stringRange, with: string)
        return updatedText.count <= 10
    }
    
    func hideKeyboardWhenTappingAround(){
        let tap: UIGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        self.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard(){
        self.endEditing(true)
    }

}
