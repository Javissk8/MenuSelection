//
//  ReuseIdentifier.swift
//  Prueba tecnica
//
//  Created by Javier Vazquez on 05/10/20.
//  Copyright © 2020 GDG UNAM. All rights reserved.
//

import Foundation

protocol ReuseIdentifier {
    
}

extension ReuseIdentifier where Self: Any {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
