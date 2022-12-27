//
//  Coordinator.swift
//  GestureARKitLearningProjects
//
//  Created by Stephen Johnson on 12/26/22.
//

import Foundation
import RealityKit
import ARKit

class Coordinator: NSObject, ARSessionDelegate {
    
    weak var view: ARView?
    
    @objc func tapScreen(_ recognizer: UITapGestureRecognizer){
        guard let view = self.view else {
            return
        }
        let screenLocation = recognizer.location(in: view)
        
        if let tappedEntity = view.entity(at: screenLocation) as? ModelEntity {
            tappedEntity.model?.materials = [SimpleMaterial.randomColoredMaterial()]
        }
        
        let hits = view.raycast(from: screenLocation, allowing: .estimatedPlane, alignment: .horizontal)
        
        if let firstCollision = hits.first {
            let planeAnchor = ARAnchor(name: "New Anchor From Ray", transform: firstCollision.worldTransform)
            view.session.add(anchor: planeAnchor)
            
            let aSimpleMat = SimpleMaterial(color: .red, isMetallic: true) //Can work with lights in room.
            let addedMesh = ModelEntity(mesh: MeshResource.generateBox(size: 0.3), materials: [aSimpleMat])

            let anchorEntity = AnchorEntity(.plane(.horizontal, classification: .table, minimumBounds: SIMD2(x: 0.2, y: 0.2)))
            anchorEntity.addChild(addedMesh)
            
            view.scene.addAnchor(anchorEntity)
        }
    }
}
