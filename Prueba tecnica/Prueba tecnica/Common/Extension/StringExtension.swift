//
//  StringExtension.swift
//  Prueba tecnica
//
//  Created by Javier Vazquez on 04/10/20.
//

import Foundation

var tableName = "Localizables"

extension String {
    
    var localized: String {
        return NSLocalizedString(self, tableName: tableName, bundle:  Bundle.main, value: "", comment: "")
    }
    
}
