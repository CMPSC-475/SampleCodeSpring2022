//
//  ArtboardManager.swift
//  iDrawing
//
//  Created by Nader Alfares on 3/17/22.
//

import Foundation

class ArtboardManager : ObservableObject {
    @Published var drawnShapes : [Shape] = [Shape]()
    @Published var inProgressShape : Shape?
    @Published var deletedShapes : [Shape] = [Shape]()
    
    func addShape(){
        if inProgressShape != nil{
            drawnShapes.append(inProgressShape!)
            inProgressShape = nil
        }
    }
    
    func newLine(_ line: Line){
        inProgressShape = line
    }
    
    func undo(){
        let lastShape = drawnShapes.popLast()
        deletedShapes.append(lastShape!)
    }
    
    func redo() {
        let lastDeleted = deletedShapes.popLast()
        drawnShapes.append(lastDeleted!)
    }
    
}
