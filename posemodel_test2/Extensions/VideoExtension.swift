//
//  VideoExtension.swift
//  posemodeltest
//
//  Created by 명하준 on 1/5/24.
//

import Foundation
import VideoToolbox
import UIKit

extension UIImage {
    public convenience init?(pixelBuffer: CVPixelBuffer) {
        var cgImage: CGImage?
        VTCreateCGImageFromCVPixelBuffer(pixelBuffer, options: nil, imageOut: &cgImage)
        
        guard let cgImage = cgImage else {
            return nil
        }
        
        self.init(cgImage: cgImage)
    }
}
