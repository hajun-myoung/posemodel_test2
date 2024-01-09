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
            let objectDetector = try ObjectDetector(options: options)
        }
        catch {
            print("Error has been occurred while createding Object Detector")
            return nil
        }
        
        return objectDetector
    }
    
    //MARK: Object Detector by MediaPipe only get the MPImage
    /// You can convert the uiimage to the mpimage with this method: `MPImage(uiimage: uiimage)`
    func analyse_image(image: MPImage){
        
    }

}
