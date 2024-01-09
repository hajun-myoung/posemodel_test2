//
//  File.swift
//  posemodel_test2
//
//  Created by 명하준 on 1/9/24.
//

import Foundation
import UIKit

func draw_boudingBox(image: UIImage, boundingBox: CGRect) -> UIImage?{
    let imageSize = image.size
    let renderer = UIGraphicsImageRenderer(size: imageSize)
    
    let rendered_image = renderer.image { context in
        // Draw the original Image
        image.draw(at: CGPointZero)
        
        // Configurations
        context.cgContext.setLineWidth(5.0)
        UIColor.red.set()
        // Create the rectangle
        context.cgContext.addRect(boundingBox)
        // Draw it
        context.cgContext.strokePath()
    }
    
    return rendered_image
}
