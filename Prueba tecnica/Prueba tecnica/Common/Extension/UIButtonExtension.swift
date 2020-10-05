//
//  UIButtonExtension.swift
//  Prueba tecnica
//
//  Created by Javier Vazquez on 04/10/20.
//

import Foundation
import UIKit

extension UIButton {
    
    func setBorderRoundStyle(color:UIColor? = UIColor.white){
        self.layer.cornerRadius = 10
        self.backgroundColor = color
    }
    
}
