//
//  ShapeSettings.swift
//  ShapeSettingsDemo
//
//  Created by Xiaochun Shen on 2020/9/4.
//

import Foundation
import SwiftUI

class ShapeSettings: ObservableObject {
    @Published var showSettings = false
    
    static var Colors = [Color.red, Color.blue, Color.green, Color.purple, Color.orange]
    
    @Published var choseColor = 0
    
    enum Shapes: String, CaseIterable {
        case Circle, Rectangle
    }
    
    @Published var chosenShape = Shapes.Circle
    
    @Published var scale = 0.5
    
    @Published var shapeCount = 1
    
    @Published var showShapes = true
}
