//
//  CheeringView.swift
//  WeAre
//
//  Created by Nader Alfares on 1/19/22.
//

import SwiftUI

struct CheeringView: View {
    @EnvironmentObject var cheerManager : CheerManager
    var body: some View {
        VStack{
            CheeringTextView(cheerText: cheerManager.cheerModel.cheer1, isVisible: cheerManager.cheer1Visible)
            CheeringTextView(cheerText: cheerManager.cheerModel.cheer2,
                isVisible: cheerManager.cheer2Visible)
        }
    }
}

struct CheeringTextView : View {
    var cheerText : String
    var isVisible : Bool
    var body : some View {
        Text(cheerText)
            .font(.system(size: ViewConstants.cheerFontSize))
            .bold()
            .padding()
            .foregroundColor(Color.blue)
            .background(Capsule()
                                        
                                        .strokeBorder(Color.blue, lineWidth: 5)
                                        .background(Capsule().fill(Color.white)))
            .opacity(isVisible ? 1.0 : 0.0)
    }
}

struct CheeringView_Previews: PreviewProvider {
    static var previews: some View {
        CheeringView()
            .environmentObject(CheerManager())
    }
}
