//
//  ImageViewTableViewCell.swift
//  Prueba tecnica
//
//  Created by Javier Vazquez on 05/10/20.
//

import UIKit

protocol ImageViewTableViewCellDelegate: class {
    func didTakePhoto()
}

class ImageViewTableViewCell: UITableViewCell {

    @IBOutlet private weak var photoImageView: UIImageView!
    weak var delegate: ImageViewTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.photoImageView.roundCorners(corners: .allCorners, radius: 10)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureWithUrl(url: String) {
        photoImageView.image = UIImage()
        photoImageView.loadFrom(path: url)
    }
    
    func configureCameraCell(cameraImage: UIImage?) {
        if let image = cameraImage {
            photoImageView.image = image
        }
        photoImageView.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(takePicture))
        photoImageView.addGestureRecognizer(tapGesture)
    }
    
    @objc func takePicture(){
        delegate?.didTakePhoto()
    }
    
}
