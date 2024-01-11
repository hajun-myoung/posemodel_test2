
//
//  ContentView.swift
//  posemodeltest
//
//  Created by 명하준 on 12/29/23.
//

import SwiftUI
import Foundation
import UIKit

let testImage: UIImage = UIImage(named: "testimage")!
var ObjectDetectionModel: Object_Detector? = nil
var Person_BoundingBox: CGRect? = nil

struct ContentView: View {
//    @State var boundedImage: UIImage? = nil
//    @State var croppedImage: UIImage? = nil
    @State var resizedImage: UIImage? = nil
    @State var pixelbuffer320: CVPixelBuffer? = nil
    
    var body: some View {
        ScrollView{
            VStack {
                Image(uiImage: testImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                
                Button{
                    ObjectDetectionModel = Object_Detector()
                } label: {
                    Label("Load Model", systemImage: "tray.and.arrow.down.fill")
                        .font(.system(size: 24, weight: .bold))
                }
                .padding()
                
                Button{
                    resizedImage = Make_square_form(image: testImage)
                }label: {
                    Label("Image to PixelBuffer", systemImage: "chart.bar.doc.horizontal")
                        .font(.system(size: 24, weight: .bold))
                }
                .padding()
                
                // MARK: Show resized image if it does
                if let resizedImage {
                    Image(uiImage: resizedImage)
                          .resizable()
                          .aspectRatio(contentMode: .fit)
                          .padding()
                } else {
                    Text("No Resized Image is Loaded Yet")
                        .font(.system(size: 20, design: .serif))
                }
                
                Button {
                    pixelbuffer320 = Downgrade_Resolution_from_UIImage(image: resizedImage!, dest: 320)
                } label: {
                    Label("Resize Pixelbuffer", systemImage: "shippingbox.fill")
                        .font(.system(size: 24, weight: .bold))
                }
                .padding()
                
                if let pixelbuffer320 {
                    Image(uiImage: UIImage(pixelBuffer: pixelbuffer320)!)
                          .resizable()
                          .aspectRatio(contentMode: .fit)
                          .padding()
                } else {
                    Text("No Downgraded PixelBuffer is Loaded Yet")
                        .font(.system(size: 20, design: .serif))
                }
                
                Button {
                    ObjectDetectionModel?.DetectObject(
                        on: pixelbuffer320!,
                        from: CGRect(x: 0, y: 0, width: 320, height: 320),
                        to: CGSize(width: 320, height: 320)
                    )
                } label: {
                    Label("Detect Object", systemImage: "magnifyingglass.circle")
                        .font(.system(size: 24, weight: .bold))
                }
                .padding()
                

//                Button {
//                    Person_BoundingBox = ObjectDetectionModel?.DetectObject(on: pixelbuffer320, from: <#T##CGRect#>, to: <#T##CGSize#>)
//                    print("Detected!")
//                } label: {
//                    Label("Detect the Objects", systemImage: "shippingbox.fill")
//                        .font(.system(size: 24, weight: .bold))
//                }
//                .padding()

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
