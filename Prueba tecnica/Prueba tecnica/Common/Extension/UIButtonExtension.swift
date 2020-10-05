//
//  UIButtonExtension.swift
//  Prueba tecnica
//
//  Created by Javier Vazquez on 04/10/20.
//  Copyright © 2020 GDG UNAM. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    
    func setBorderRoundStyle(color:UIColor? = UIColor.white){
        self.layer.cornerRadius = 10
        self.backgroundColor = color
    }
    
}
