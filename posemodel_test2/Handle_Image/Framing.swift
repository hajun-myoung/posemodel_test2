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

func Make_square_form(image: UIImage) -> UIImage {
    let size = image.size
    let distance = Int(size.width > size.height ? size.width : size.height)
    
    let newSize = CGSize(width: distance, height: distance)
    
    let renderer = UIGraphicsImageRenderer(size: newSize)
    let squaredImage = renderer.image { context in
        image.draw(at: CGPointZero)
    }
    
    return squaredImage
}

func Downgrade_resolution(image: UIImage, dest: Int) -> UIImage {
    let size = image.size
    let newSize = CGSize(width: dest, height: dest)
    
    if size.width != size.height {
        fatalError("Image's width and height is not same. Use *Make_square_form* func")
    }
    
    let pixelbuffer = buffer(from: image)
    let sourceRect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
    let downgradedBuffer = pixelbuffer?.resize(from: sourceRect, to: newSize)
    
    let downgradedImage = UIImage(pixelBuffer: downgradedBuffer!)!
    
    return downgradedImage
}
