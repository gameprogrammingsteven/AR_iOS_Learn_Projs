//
//  UIColor+Extensions.swift
//  GestureARKitLearningProjects
//
//  Created by Stephen Johnson on 12/26/22.
//

import Foundation
import UIKit

extension UIColor {
    
    static func randomSolidColor() -> UIColor {
        UIColor(red: randPct(), green: randPct(), blue: randPct(), alpha: 1.0)
    }
    
    private static func randPct() -> Double {
        return Double.random(in: 0...1)
    }
}
