//
//  OccludeCoordinator.swift
//  GestureARKitLearningProjects
//
//  Created by Stephen Johnson on 12/27/22.
//

import Foundation
import RealityKit
import ARKit
import AVFoundation
import Combine

class OccludeCoordinator: NSObject { //Removed ARKit stuff in favor of Reality
    var arView: ARView?
    var cancellable: AnyCancellable?
    
    func setInitial() {
            //same code as anything, just use a different material. Skipping lecture.
    }

}
