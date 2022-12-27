//
//  ARViewContainerOcclusion.swift
//  GestureARKitLearningProjects
//
//  Created by Stephen Johnson on 12/27/22.
//

import Foundation
import RealityKit
import AVFoundation
import SwiftUI

struct ARViewContainerOcclusion: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        
        context.coordinator.arView = arView
        context.coordinator.setInitial()
        
        guard let videoFileLocation = Bundle.main.url(forResource:"VideoFile", withExtension:"filename") else {
            return arView
        }
        
        let player = AVPlayer(url: videoFileLocation)
        //Use video material
        
        let mat = VideoMaterial(avPlayer: player)
        
//        mat.controller.audioInputMode  = // Spatial sound or non
        
        return arView
    }
    
    func makeCoordinator() -> OccludeCoordinator {
        OccludeCoordinator()
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
}
