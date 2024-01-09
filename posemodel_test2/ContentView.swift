//
//  ContentView.swift
//  posemodeltest
//
//  Created by 명하준 on 12/29/23.
//

import SwiftUI
import Foundation
import UIKit

struct ContentView: View {
    var body: some View {
        ScrollView{
            VStack {
                Button{
                    
                } label: {
                    Label("Load Model", systemImage: "tray.and.arrow.down.fill")
                        .font(.system(size: 24, weight: .bold))
                }
                
            }
        }
    }
}

#Preview {
    ContentView()
}
