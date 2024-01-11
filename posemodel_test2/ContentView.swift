//
//  ContentView.swift
//  posemodeltest
//
//  Created by 명하준 on 12/29/23.
//

import SwiftUI
import Foundation
import UIKit

var ObjectDetectionModel: Object_Detector? = nil
let testImage: UIImage? = UIImage(named: "testimage")!
var Person_BoundingBox: CGRect? = nil

struct ContentView: View {
    @State var boundedImage: UIImage? = nil
    @State var croppedImage: UIImage? = nil
    
    var body: some View {
        ScrollView{
            VStack {
                if let testImage {
                    Image(uiImage: testImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                }
                
                Button{
                    ObjectDetectionModel = Object_Detector()
                } label: {
                    Label("Load Model", systemImage: "tray.and.arrow.down.fill")
                        .font(.system(size: 24, weight: .bold))
                }
                .padding()
//                
//                Button {
//                    Person_BoundingBox = ObjectDetectionModel?.analyse_image(image: testImage!)
//                    print("Detected!")
//                } label: {
//                    Label("Detect the Objects", systemImage: "shippingbox.fill")
//                        .font(.system(size: 24, weight: .bold))
//                }
//                .padding()
//                
//                Button {
//                    if let Person_BoundingBox {
//                        boundedImage = draw_boudingBox(
//                            image: testImage!, boundingBox: Person_BoundingBox
//                        )
//                    }
//                    else
//                    {
//                        print("No Bounding Box for Human Detected")
//                    }
//                } label: {
//                    Label("Drawing the Bounding box for Person", systemImage: "hand.draw.fill")
//                        .font(.system(size: 24, weight: .bold))
//                }
//                
//                if let boundedImage {
//                    Image(uiImage: boundedImage)
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .cornerRadius(10)
//                }
//                
//                Button {
//                    croppedImage = Crop_with_margin(
//                        image: testImage!, margin_ratio: 0.2, to: Person_BoundingBox!
//                    )
//                }label: {
//                    Label("Crop the Image", systemImage: "scissors")
//                        .font(.system(size: 24, weight: .bold))
//                }
//                
//                if let croppedImage {
//                    let size = croppedImage.size
//                    let ratio = size.height / size.width
//                    let newWidth = 300.0
//                    let newHeight = newWidth * ratio
//                    Image(uiImage: croppedImage)
//                        .resizable()
//                        .frame(width: newWidth, height: newHeight)
//                        .cornerRadius(10)
//                }
//                
                
            }
        }
    }
}

#Preview {
    ContentView()
}
