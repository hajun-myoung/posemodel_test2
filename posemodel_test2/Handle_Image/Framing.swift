//
//  Framing.swift
//  posemodel_test2
//
//  Created by 명하준 on 1/9/24.
//

import Foundation
import UIKit

func Crop_with_margin(image: UIImage, margin_ratio: Double, to: CGRect) -> UIImage {
    let newX = CGFloat(to.minX - to.width * margin_ratio / 2)
    let newY = CGFloat(to.minY - to.height * margin_ratio / 2)
    
    let newWidth = CGFloat(to.width * (1 + margin_ratio))
    let newHeight = CGFloat(to.height * (1 + margin_ratio))
    
    let new_crop_area = CGRect(x: newX, y: newY, width: newWidth, height: newHeight)
    
    let cropped_image = image.cgImage!.cropping(to: new_crop_area)
    
    return UIImage(cgImage: cropped_image!)
}
