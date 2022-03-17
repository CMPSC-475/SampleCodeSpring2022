//
//  PracticeView.swift
//  iDrawing
//
//  Created by Nader Alfares on 3/17/22.
//

import SwiftUI



struct PracticeView: View {
    let boardWidth : CGFloat = UIScreen.main.bounds.width
    let boardHeight: CGFloat = 275
    var body: some View {
        ZStack {
            Color.gray.ignoresSafeArea()
        VStack{
            Image("yoda")
                .resizable()
                .scaledToFit()
                .frame(width: boardWidth, height: boardHeight)
                //.gesture(dragGesture)
            Canvas { context, size in
                //TODO: -
            }
            .background(.white)
            .frame(width: boardWidth, height: boardHeight)
        }
        }
    }
}

struct PracticeView_Previews: PreviewProvider {
    static var previews: some View {
        PracticeView()
    }
}
