//
//  PokemonCardView.swift
//  GestureExamples
//
//  Created by Nader Alfares on 3/2/22.
//

import SwiftUI

struct PokemonCardView: View {
    @EnvironmentObject var manager : Manager

    @Binding var pokemon : Pokemon
    let angleChangeFactor : CGFloat = 0.05
    let offScreen : CGFloat = 400
    let translationThreshold : CGFloat = 100
    @State private var offset: CGSize = .zero
    @State private var angle = Angle(degrees: 0)

    // offset of card based on status
    var computedOffset : CGSize {
        switch pokemon.status {
        case .unDecided:
            return CGSize.zero
        case .kept:
            return CGSize(width: offScreen, height: 0)
        case .traded:
            return CGSize(width: -offScreen, height: 0)
        }
    }
    
    var body: some View {
        let drag = DragGesture()
            .onChanged {v in
                //TODO:
            }
            .onEnded {v in
               //TODO:
            }
                
        
        return CardView(pokemon: pokemon)
                //TODO: add gesture

    }
    
    func dragEnded(with v:DragGesture.Value) {
        //TODO:
    }
}

struct CardView : View {
    let pokemon : Pokemon
    var body : some View {
        ZStack {
            Rectangle()
                .foregroundColor(.gray)
                .cornerRadius(50)
            Image(pokemon.imageName)
                .resizable()
                .scaledToFit()
                .padding(40)
                
        }
        .frame(width: 300, height: 400)
    }
}

//struct PokemonCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        //PokemonCardView(pokemon: .constant(Pokemon.standard))
//        CardView(pokemon: Pokemon.standard)
//    }
//}
