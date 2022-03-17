//
//  ArtboardView.swift
//  iDrawing
//
//  Created by Nader Alfares on 3/17/22.
//

import SwiftUI

struct ArtboardView: View {
    @ObservedObject var manager = ArtboardManager()
    @State var colorSelected : Color = .blue
    @State var thickness : Double = 2.0
    
    var body: some View {
        
        let dragGesture = DragGesture(minimumDistance: 0.00000)
            .onChanged({ value in
                if manager.inProgressShape == nil {
                    manager.inProgressShape = Line(points: [], color: colorSelected, lineWidth: thickness)
                    manager.deletedShapes.removeAll()
                } else {
                    var _shape = manager.inProgressShape as! Line
                    _shape.points.append(value.location)
                    manager.inProgressShape = _shape
                }
            })
            .onEnded { value in
                // Don't really need switch, just for illustration
                switch manager.inProgressShape!.type {
                case .line:
                    manager.addShape()
                default:
                    break
                }
            }
        
        
        return VStack {
            ZStack {
                Color.white
                Canvas { context, size in
                    
                    for _shape in manager.drawnShapes {
                        let _line = _shape as! Line
                        var path = Path()
                        path.addLines(_line.points)
                        context.stroke(path, with: .color(_line.color), lineWidth: _line.lineWidth)
                        
                    }
                    
                    if manager.inProgressShape != nil {
                        
                        let _line = manager.inProgressShape as! Line
                        var path = Path()
                        path.addLines(_line.points)
                        context.stroke(path, with: .color(_line.color), lineWidth: _line.lineWidth)
                    }
                    
                    
                }
                .gesture(dragGesture)
            }
            Spacer()
            BottomToolbarView()
                .environmentObject(manager)
        }
    }
}

struct ArtboardView_Previews: PreviewProvider {
    static var previews: some View {
        ArtboardView()
    }
}
