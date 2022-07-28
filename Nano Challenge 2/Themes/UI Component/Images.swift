//
//  Images.swift
//  Nano Challenge 2
//
//  Created by Karen Natalia on 26/07/22.
//

import Foundation
import UIKit

func createImage(imageName: String) -> UIImageView {
    let imageView = UIImageView()
    imageView.image = UIImage(systemName: imageName)
    imageView.contentMode = .scaleAspectFit
    return imageView
}
