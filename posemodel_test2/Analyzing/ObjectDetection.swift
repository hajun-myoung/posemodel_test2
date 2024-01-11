//
//  ObjectDetection.swift
//  posemodel_test2
//
//  Created by 명하준 on 1/8/24.
//

import Foundation
import TensorFlowLite

struct Model {
    let name: String
    let extensions: String
}

class Object_Detector {
    private var interpreter: Interpreter
    
    private var inputTensor: Tensor
    private var heatsTensor: Tensor
    private var offsetsTensor: Tensor
    
    init()
    {
        do
        {
            let objectDetectionModelFile = Model(name: "efficientdet_lite0", extensions: "tflite")

            //MARK: Loading Model File
            let modelPath = Bundle.main.path(
                forResource: objectDetectionModelFile.name, ofType: objectDetectionModelFile.extensions
            )
            
            interpreter = try Interpreter(modelPath: modelPath!)
            try interpreter.allocateTensors()
            
            inputTensor = try interpreter.input(at: 0)
            heatsTensor = try interpreter.output(at: 0)
            offsetsTensor = try interpreter.output(at: 1)
            
            // Testing Model's Tensors
             print("Tensors:")
             print("input: \(inputTensor)")
             print("output: \(heatsTensor)")
             print("offset: \(offsetsTensor)")
            
        }
        catch{
            fatalError("Failed to Initialize Object Detection Model")
        }
    }
    
    /// Detecting Object
    ///
    /// - Parameters
    ///     - on: Input Image Pixelbuffer
    ///     - from: CGRect, Input Image Range
    ///     - to: CGSize, Result Size
    func DetectObject(
        on pixelbuffer: CVPixelBuffer,
        from source: CGRect,
        to dest: CGSize
    ) {
        preprocess(of: pixelbuffer, from: source)
    }
    
    /// Preprocessing
    ///
    /// - Parameters
    ///     - of: Input Image Pixelbuffer
    ///     - from: Get From Source, Input Image's Range
    /// - Returns: 320 by 320 pixelBuffer, without alpha value
    private func preprocess(
        of pixelbuffer: CVPixelBuffer,
        from targetSquare: CGRect
    ){
        let pixelFormat = CVPixelBufferGetPixelFormatType(pixelbuffer)
        print(pixelFormat)
    }
}
