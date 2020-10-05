//
//  UIImageViewExtension.swift
//  Prueba tecnica
//
//  Created by Javier Vazquez on 05/10/20.
//

import Foundation
import UIKit

extension UIImageView {
    
    func loadFrom(path: String?, cache: Bool = false, placeHolder: UIImage? = nil) {
        guard let path = path, !path.isEmpty, let realPath = path.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed), let url = URL(string: realPath) else {
            self.image = placeHolder
            return
        }
        URLSession(configuration: cache ? .default : .ephemeral).dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {[weak self] in
                guard let data = data else {
                    self?.image = placeHolder
                    return
                }
                guard let self = self else { return }
                self.image = UIImage(data: data)
            }
        }.resume()
    }
    
}
