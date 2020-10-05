//
//  UserOption.swift
//  Prueba tecnica
//
//  Created by Javier Vazquez on 04/10/20.
//

import Foundation

class UserOption {
    
    var name: String = ""
    var isEnabled: Bool = false
    
    init (name: String, isEnabled: Bool) {
        self.name = name
        self.isEnabled = isEnabled
    }
}
