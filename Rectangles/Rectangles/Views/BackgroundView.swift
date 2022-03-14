//
//  BackgroundView.swift
//  Rectangles
//
//  Created by Hannan, John Joseph on 11/12/21.
//

import SwiftUI

struct BackgroundView: View {
    @EnvironmentObject var manager : GameManager
    
    var body: some View {
        ZStack {
            Color.gray
            
            BottomBar()
        }
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
