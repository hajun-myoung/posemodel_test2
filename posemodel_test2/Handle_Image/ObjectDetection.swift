//
//  ObjectDetection.swift
//  posemodel_test2
//
//  Created by 명하준 on 1/8/24.
//

import Foundation
import MediaPipeTasksVision

struct Model {
    let name: String
    let extensions: String
}

class Object_Detector {
    var objectDetector: ObjectDetector? = nil
    
    init(){
        print("\nInitialize The Object Detector...")
        self.objectDetector = Load_ObjectDetection()
    }
    
    private func Load_ObjectDetection() -> ObjectDetector? {
        let objectDetectionModel = Model(name: "efficientdet_lite0", extensions: "tflite")

        //MARK: Loading Model File
        guard let modelPath = Bundle.main.path(forResource: objectDetectionModel.name, ofType: objectDetectionModel.extensions)
        else {
            print("No model file named \(objectDetectionModel.name)")
            return nil
        }

        //MARK: Setting Object Dection Configurations Up
        /// Below code are given by Mediapipe, Google
        let options = ObjectDetectorOptions()
        options.baseOptions.modelAssetPath = modelPath
        options.runningMode = .image
        options.maxResults = 5
        
        do{
            objectDetector = try ObjectDetector(options: options)
        }
        catch {
            print("Error has been occurred while createding Object Detector")
            return nil
        }
        
        return objectDetector
    }
    
    //MARK: Object Detector by MediaPipe only get the MPImage
    /// You can convert the uiimage to the mpimage with this method: `MPImage(uiimage: uiimage)`
    func analyse_image(image: UIImage) -> CGRect?{
        let objectDetector = self.objectDetector
        var mpimage: MPImage
        var result: ObjectDetectorResult? = nil
        
        do {
            mpimage = try MPImage(uiImage: image)
        } catch {
            print("Failed to convert UIImage to MPImage")
            return nil
        }
            
        do {
            result = try objectDetector?.detect(image: mpimage)
        }
        catch {
            print("Error to detect some objects on given image")
            return nil
        }
        
        var isPersonIncluded:Bool = false
        var humanCoordinates:CGRect? = nil
        
        result?.detections.forEach({
            $0.categories.forEach({
                if $0.categoryName == "person" {
                    isPersonIncluded = true
                }
            })
            humanCoordinates = $0.boundingBox
        })
        
        if isPersonIncluded {
            return humanCoordinates
        }
        else {
            print("There are no one detected 'Person' Object")
            return nil
        }
    }
}
