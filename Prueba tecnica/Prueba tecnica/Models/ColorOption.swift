//
//  ColorOption.swift
//  Prueba tecnica
//
//  Created by Javier Vazquez on 04/10/20.
//

import Foundation
import UIKit

class ColorOption {
    
    var name: String = ""
    var color: UIColor = UIColor()
    var isEnabled: Bool = false
    
    init(name: String, color: UIColor, isEnabled: Bool) {
        self.name = name
        self.color = color
        self.isEnabled = isEnabled
    }
}
