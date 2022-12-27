//
//  Material+Extensions.swift
//  GestureARKitLearningProjects
//
//  Created by Stephen Johnson on 12/26/22.
//

import Foundation
import UIKit
import RealityKit

extension SimpleMaterial {
    static func randomColoredMaterial(_ metallic: Bool = true) -> Material {
        return SimpleMaterial(color: UIColor.randomSolidColor(), isMetallic: metallic)
    }
}
