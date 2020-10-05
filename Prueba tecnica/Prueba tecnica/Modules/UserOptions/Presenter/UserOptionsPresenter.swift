//
//  UserOptionsPresenter.swift
//  Prueba tecnica
//
//  Created by Javier Vazquez on 04/10/20.
//

import Foundation

class UserOptionsPresenter {
    
    var userOptionsList: [UserOption] = [UserOption(name: "CAMERA".localized, isEnabled: false),
                                         UserOption(name: "PHOTO".localized, isEnabled: false),
                                         UserOption(name: "FULL_NAME".localized, isEnabled: false),
                                         UserOption(name: "PHONE_NUMBER".localized, isEnabled: false),
                                         UserOption(name: "BIRTHDATE".localized, isEnabled: false),
                                         UserOption(name: "GENDER".localized, isEnabled: false),
                                         UserOption(name: "FAVORITE_COLOR".localized, isEnabled: false)
                                        ]
    
}
