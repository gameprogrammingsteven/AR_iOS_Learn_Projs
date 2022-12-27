//
//  Coordinator.swift
//  GestureARKitLearningProjects
//
//  Created by Stephen Johnson on 12/26/22.
//

import Foundation
import RealityKit
import ARKit
import Combine

class Coordinator: NSObject { //Removed ARKit stuff in favor of Reality
    
    weak var view: ARView?
    var cancellable: AnyCancellable?
    
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
//            view.session.add(anchor: planeAnchor) No more session
            
            let anchorEntity = AnchorEntity(world: firstCollision.worldTransform)
            
            
            cancellable = ModelEntity.loadAsync(named: "fenderGuitar")
                .sink { loadComplete in
                    if case let .failure(e) = loadComplete {
                        print("Unable to load Guitar")
                        self.cancellable?.cancel()
                    }
                } receiveValue: { entity in
                    anchorEntity.addChild(entity)
                }

            //Slower code, erase/comment next line
            guard let guitar = try? ModelEntity.load(named: "fenderGuitar") else {
                print("fender guitar not found") //Debug print, not in prod.
                return
            }
            
            anchorEntity.addChild(guitar)
            
//            let aSimpleMat = SimpleMaterial(color: .red, isMetallic: true) //Can work with lights in room.
//            let addedMesh = ModelEntity(mesh: MeshResource.generateBox(size: 0.3), materials: [aSimpleMat])
//            addedMesh.generateCollisionShapes(recursive: true)
//
//            anchorEntity.addChild(addedMesh)
            
            
            view.scene.addAnchor(anchorEntity)
            
            view.installGestures(.all, for: guitar)
        }
    }
}
