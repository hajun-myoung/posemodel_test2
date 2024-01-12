//
//  ObjectDetection.swift
//  posemodel_test2
//
//  Created by 명하준 on 1/8/24.
//

import Foundation
import TensorFlowLite
import os

typealias FileInfo = (filename: String, extension: String)
enum Model{
    static let FileInfo = (
        filename: "efficientdet_lite0",
        extension: "tflite"
    )

    static let isQuantized = false
}

//struct Result {
//    var
//}

class Object_Detector {
    private var interpreter: Interpreter
    
    private var inputTensor: Tensor
    private var heatsTensor: Tensor
    private var offsetsTensor: Tensor
    
    init()
    {
        do
        {
            //MARK: Loading Model File
            let modelPath = Bundle.main.path(
                forResource: Model.FileInfo.filename, ofType: Model.FileInfo.extension
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
        let inputData = preprocess(of: pixelbuffer, from: source)!
        inference(from: inputData)
        postprocess(to: CGSize(width: 320, height: 320))
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
    ) -> Data?
    {
        let pixelFormat = CVPixelBufferGetPixelFormatType(pixelbuffer)
        assert(pixelFormat == kCVPixelFormatType_32ABGR
            || pixelFormat == kCVPixelFormatType_32ARGB
            || pixelFormat == kCVPixelFormatType_32BGRA
            || pixelFormat == kCVPixelFormatType_32RGBA
        )
        
        guard let inputData = pixelbuffer.rgbData(isModelQuantized: Model.isQuantized)
        else {
            os_log("Failed to convert PixelBuffer to RGB Data", type: .error)
            return nil
        }
        
        return inputData
    }
    
    /// Inferencing: Run Model, Got Result Data
    ///
    /// - Parameters
    ///     - data: Data
    /// - Returns:Nothing. Just Update the Tensors
    private func inference(from data: Data){
        do {
            /// Inserting Data
            try interpreter.copy(data, toInputAt: 0)
            /// Run Model
            try interpreter.invoke()
            
            /// Update Tensors
            heatsTensor = try interpreter.output(at: 0)
            offsetsTensor = try interpreter.output(at: 1)
        }
        catch {
            os_log("Failed to invoke the Object Detection", type: .error)
            return
        }
    }
    
    private func postprocess(to viewSize: CGSize) {
        print(heatsTensor)
//        let bytes = heatsTensor.data.toArray(type: Float32.self)
//        let floatArray = bytes.map { Float32($0) }
        
//        print(floatArray)
    }
}
