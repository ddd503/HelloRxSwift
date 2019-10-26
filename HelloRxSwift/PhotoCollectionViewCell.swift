//
//  PhotoCollectionViewCell.swift
//  HelloRxSwift
//
//  Created by kawaharadai on 2019/10/26.
//  Copyright © 2019 kawaharadai. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak private var photoImageView: UIImageView!

    func setInfo(image: UIImage?) {
        photoImageView.image = image
    }
}
