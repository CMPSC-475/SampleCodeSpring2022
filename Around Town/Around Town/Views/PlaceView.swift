//
//  SpotView.swift
//  Downtown
//
//  Created by Hannan, John Joseph on 9/27/21.
//

import SwiftUI

struct PlaceView: View {
    @Binding var place : Place?
    var body: some View {
        
        if let place = place {
            VStack{
                Text(place.title)
                    .font(.title)
                    .bold()
                
                Text(place.address)
                    .font(.title)
            }
        } else {
            Text("nobody")
        }

    }
}

//struct SpotView_Previews: PreviewProvider {
//    static var previews: some View {
//        SpotView(spot: .constant(LocationModel().favorites[0]))
//    }
//}
