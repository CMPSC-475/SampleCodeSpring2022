//
//  DraggableModifier.swift
//  GestureExamples
//
//  Created by Nader Alfares on 2/28/22.
//
import Foundation
import SwiftUI

struct Draggable : ViewModifier {
    @Binding var location : CGPoint
    @State private var scale : CGFloat = 1.0
    
    func body(content: Content) -> some View {
        let pressAndDrag = LongPressGesture(minimumDuration: 0.01).sequenced(before: DragGesture())
            .onChanged { value in
                switch value {
                case .first(_):
                    withAnimation {
                        scale = 1.2
                    }
                case .second(true, let dragValue):
                    self.location = dragValue?.location ?? self.location
                default:
                    break
                }
            }
            .onEnded { value in
                switch value {
                case .first(true), .second(true, _):
                    withAnimation {
                        scale = 1.0
                    }
                default:
                    break
                }
            }
        return content
            .scaleEffect(scale)
            .position(location)
            .gesture(pressAndDrag)
    }
    
}


extension View {
    func draggable(location : Binding<CGPoint> ) -> some View {
        return self.modifier(Draggable(location: location))
    }
}
