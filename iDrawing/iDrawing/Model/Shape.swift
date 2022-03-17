//
//  Shape.swift
//  iDrawing
//
//  Created by Nader Alfares on 3/17/22.
//

import Foundation
import SwiftUI

enum ShapeType : String {
    case line, rectangle, ellipse
}

protocol Shape {
    var type : ShapeType {get set}
}

struct Line : Shape {
    var type = ShapeType.line
    var points = [CGPoint]()
    var color = Color.red
    var lineWidth : Double = 1.0
}

struct Rectangle : Shape {
    var type = ShapeType.rectangle
    //TODO: -
}

struct Ellipse : Shape {
    var type = ShapeType.ellipse
    //TODO: -
    
}
