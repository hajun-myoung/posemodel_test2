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
    
    //MARK: Object Detector by MediaPipe only get the MPImage
    /// You can convert the uiimage to the mpimage with this method: `MPImage(uiimage: uiimage)`
//    func analyse_image(image: UIImage) -> CGRect?{
//        let objectDetector = self.objectDetector
//        var mpimage: MPImage
//        var result: ObjectDetectorResult? = nil
//        
//        do {
//            mpimage = try MPImage(uiImage: image)
//        } catch {
//            print("Failed to convert UIImage to MPImage")
//            return nil
//        }
//            
//        do {
//            result = try objectDetector?.detect(image: mpimage)
//        }
//        catch {
//            print("Error to detect some objects on given image")
//            return nil
//        }
//        
//        var isPersonIncluded:Bool = false
//        var humanCoordinates:CGRect? = nil
//        var detectedObjectList: [String?]? = []
//        
//        result?.detections.forEach({
//            var categoryName: String? = nil
//            $0.categories.forEach({
//                categoryName = $0.categoryName
//                detectedObjectList?.append(categoryName)
//            })
//            
//            if categoryName == "person" {
//                humanCoordinates = $0.boundingBox
//                isPersonIncluded = true
//            }
//        })
//        
//        if isPersonIncluded {
//            return humanCoordinates
//        }
//        else {
//            print("There are no one detected 'Person' Object")
//            
//            print("\nDetected Objects List:")
//            dump(detectedObjectList)
//            
//            return nil
//        }
//    }
}
