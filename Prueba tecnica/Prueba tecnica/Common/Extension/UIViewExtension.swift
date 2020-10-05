//
//  UIViewExtension.swift
//  Prueba tecnica
//
//  Created by Javier Vazquez on 05/10/20.
//  Copyright © 2020 GDG UNAM. All rights reserved.
//

import Foundation
import UIKit

extension UIView : ReuseIdentifier {
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
