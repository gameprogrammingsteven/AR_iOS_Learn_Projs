//
//  ContentView.swift
//  GestureARKitLearningProjects
//
//  Created by Stephen Johnson on 12/26/22.
//

import SwiftUI
import RealityKit

struct ContentView : View {
    var body: some View {
        ARViewContainer().edgesIgnoringSafeArea(.all)
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        
        arView.addGestureRecognizer(UITapGestureRecognizer(target: context.coordinator, action: #selector(tapScreen:)))
        var horizontalAnchor = AnchorEntity(.plane(.horizontal, classification: .floor, minimumBounds:  SIMD2(x: 0.2, y: 0.2))) //20cm minimum bound
        horizontalAnchor.name = "First Plane"
        
        let aSimpleMat = SimpleMaterial(color: .blue, isMetallic: false) //Can work with lights in room.
        let cube = ModelEntity(mesh: MeshResource.generateBox(size: 0.3), materials: [aSimpleMat])
        arView.scene.anchors.append(horizontalAnchor)
        
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif