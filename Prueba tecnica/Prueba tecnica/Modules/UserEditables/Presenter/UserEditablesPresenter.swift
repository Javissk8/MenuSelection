//
//  UserEditablesPresenter.swift
//  Prueba tecnica
//
//  Created by Javier Vazquez on 04/10/20.
//

import Foundation
import UIKit

class UserEditablesPresenter {
    var userOptionsList: [UserOption] = []
    var colorOptions: [ColorOption] = [ColorOption(name: "RED".localized, color: .red, isEnabled: false),
                                       ColorOption(name: "BLUE".localized, color: .blue, isEnabled: false),
                                       ColorOption(name: "GREEN".localized, color: .green, isEnabled: false),
                                       ColorOption(name: "PINK".localized, color: .systemPink, isEnabled: false),
                                       ColorOption(name: "PURPLE".localized, color: .purple, isEnabled: false)
                                        ]
    var cameraImage: UIImage?
    var imageUrl: String = "https://http2.mlstatic.com/vegeta-tamano-real-para-armar-en-papercraft-D_NQ_NP_892880-MLA26232224460_102017-F.jpg"
    var genders: [Gender] = [Gender(name: "FEMALE".localized, isEnabled: false), Gender(name: "MALE".localized, isEnabled: false)]
    var showCheckMarkIndex = -1
}


