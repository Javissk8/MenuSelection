//
//  ReuseIdentifier.swift
//  Prueba tecnica
//
//  Created by Javier Vazquez on 05/10/20.
//

import Foundation

protocol ReuseIdentifier {
    
}

extension ReuseIdentifier where Self: Any {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
