//
//  ContentView.swift
//  posemodeltest
//
//  Created by 명하준 on 12/29/23.
//

import SwiftUI
import Foundation
import UIKit

private var overlayViewFrame: CGRect?
private var previewViewFrame: CGRect?

struct ContentView: View {
    @State var showImage: Bool = false
    
    var body: some View {
        ScrollView{
            VStack {
                Button{
//                    myModel = load_model()
                } label: {
                    Label("Load Model", systemImage: "tray.and.arrow.down.fill")
                        .font(.system(size: 24, weight: .bold))
                }
                
                .padding()
                
                Button(action: {
//                    imageHandler = image_handler(image: myImage)
//                    myImage = imageHandler!.getCurrentImage()
                    
                    self.showImage.toggle()
                })
                {
                    Label("Get an Test Image", systemImage: "photo")
                        .font(.system(size: 24, weight: .bold))
                }
                .padding()
                
//                if showImage{
//                    Image(uiImage: myImage)
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .cornerRadius(10)
//                        .padding()
//                }
                
                Button{
//                    myCVPixelBuffer = buffer(from: myImage)
//                    // myCVPixelBuffer = buffer(from: resizedImage!)
//                    if let myCVPixelBuffer{
//                        print("A test image successfully converted to CVPixelBuffer")
//                    }
                }label: {
                    Label("Image to CVPixelBuffer", systemImage: "chart.bar.doc.horizontal")
                        .font(.system(size: 24, weight: .bold))
                }
                .padding()
                
//                if let resizedImage = resizedImage {
//                    Image(uiImage: resizedImage)
//                          .resizable()
//                          .aspectRatio(contentMode: .fit)
//                          .cornerRadius(10)
//                          .padding()
//                }
                
                Button {
                    print("Start to run model")
//                    if let pixelbuffer = myCVPixelBuffer {
//                        overlayViewFrame = CGRect(origin: CGPoint(x:0, y:0), size: CGSize(width: 256, height: 256))
//                        previewViewFrame = CGRect(origin: CGPoint(x:0, y:0), size: CGSize(width: 256, height: 256))
//                        let modelInputRange = overlayViewFrame?.applying(
//                            (previewViewFrame?.size.transformKeepAspect(toFitIn: pixelbuffer.size))!
//                        )
//                    
//                        let result = myModel?.runPoseModel(on: pixelbuffer, from: modelInputRange!, to: overlayViewFrame!.size)
//                        
//                        global_result = result?.0
//                    
//                        if let result = result {
//                            print("\nThe model succesfully analyzed\n")
//                            
//                            print("**Taken times")
//                            print("\tPreprocessing Time: \(result.1.preprocessing)")
//                            print("\tInferencing Time: \(result.1.inference)")
//                            print("\tPostprocessing Time: \(result.1.postprocessing)")
//                            
//                            var totaltakenTime:Double = 0.0
//                            totaltakenTime += result.1.preprocessing
//                            totaltakenTime += result.1.inference
//                            totaltakenTime += result.1.postprocessing
//                            
//                            print("\n\tTotal Taken: \(totaltakenTime)")
//                            
//                            let FRAME_PER_SECOND = 30
//                            let FRAME_SECOND:Double = (1.0 / Double(FRAME_PER_SECOND))
//                            let FRAME_MSEC:Double = FRAME_SECOND * 1000.0
//                            
//                            let analyse_ratio: Float = Float(totaltakenTime / FRAME_MSEC)
//                            
//                            print("\n\tAnalyse Ratio: \(analyse_ratio)\n")
//                        } else {
//                            print("No result after the Model Invoking")
//                        }
//                    } else {
//                        fatalError("No pixel buffer")
//                    }
                    print("End of the task: Running Model by the PixelBuffer")
                } label: {
                    Label("Run Model", systemImage: "figure.run")
                        .font(.system(size: 24, weight: .bold))
                }
                .padding()
                
                Button {
//                    var defaultDots: [CGPoint] = []
//                    
//                    for coordi in 0..<10 {
//                        let newDot = CGPoint(x: 10 * coordi, y: 10 * coordi)
//                        defaultDots.append(newDot)
//                    }
//                    
//                    afterDrawingImage = imageHandler!.draw_dots(dots: global_result?.dots ?? defaultDots, radius: CGFloat(15))
                    
                }label: {
                    Label("Draw the Joint Points", systemImage: "photo")
                        .font(.system(size: 24, weight: .bold))
                }
                .padding()
                
//                if let image = afterDrawingImage {
//                    Image(uiImage: image)
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .cornerRadius(10)
//                        .padding()
//                }
                
            }
        }
    }
}

#Preview {
    ContentView()
}
