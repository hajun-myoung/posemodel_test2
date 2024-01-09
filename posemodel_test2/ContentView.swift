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

struct ContentView: View {
    var body: some View {
        ScrollView{
            VStack {
                if let testImage {
                    Image(uiImage: testImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                        .padding()
                }
                
                Button{
                    ObjectDetectionModel = Object_Detector()
                } label: {
                    Label("Load Model", systemImage: "tray.and.arrow.down.fill")
                        .font(.system(size: 24, weight: .bold))
                }
                .padding()
                
                Button {
                    ObjectDetectionModel?.analyse_image(image: testImage!)
                } label: {
                    Label("Detect the Objects", systemImage: "shippingbox.fill")
                        .font(.system(size: 24, weight: .bold))
                }
                .padding()
            }
        }
    }
}

#Preview {
    ContentView()
}
