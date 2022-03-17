//
//  BottomToolbarView.swift
//  iDrawing
//
//  Created by Nader Alfares on 3/17/22.
//

import SwiftUI

struct BottomToolbarView: View {
    @EnvironmentObject var manager : ArtboardManager
    @State var color : Color = .blue
    @State var slider : Double = 1.0
    var body: some View {
        VStack{
            Divider()
            HStack {
                Button(action: {manager.undo()}, label: {Text("undo")})
                    .disabled(manager.drawnShapes.isEmpty)
                Button(action: {manager.redo()}, label: {Text("redo")})
                    .disabled(manager.deletedShapes.isEmpty)
                
                ColorPicker("", selection: $color)
                Slider(value: $slider, in: 1...30)
                
                
                
                
            }
            .padding()
        }

    }
}

//struct BottomToolbarView_Previews: PreviewProvider {
//    static var previews: some View {
//        BottomToolbarView()
//    }
//}
