//
//  Gender.swift
//  Prueba tecnica
//
//  Created by Javier Vazquez on 05/10/20.
//  Copyright © 2020 GDG UNAM. All rights reserved.
//

import Foundation

class Gender {
    var name: String = ""
    var isEnabled: Bool = false
    
    init(name: String, isEnabled: Bool) {
        self.name = name
        self.isEnabled = isEnabled
    }
}
