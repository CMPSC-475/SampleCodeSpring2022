//
//  CardStackView.swift
//  GestureExamples
//
//  Created by Nader Alfares on 3/2/22.
//

import SwiftUI

struct CardStackView: View {
    @StateObject var manager = Manager()
    
    var body: some View {
        VStack {
        ZStack {
            ForEach($manager.pokemons) { $p in
                PokemonCardView(pokemon: $p)
            }
            .padding(80)
        }
            HStack {
                Score(title: "Traded", count: manager.traded.count)
                Spacer()
                Button("Reset") {
                        manager.reset()
                }
                Spacer()
                Score(title: "Kept", count: manager.kept.count)
            }
            .padding()
        }
        .environmentObject(manager)
    }

}

struct Score : View {
    var title : String
    var count : Int
    var body : some View {
        VStack {
            Text(title)
            Text("\(count)")
        }
    }
}


struct CardStackView_Previews: PreviewProvider {
    static var previews: some View {
        CardStackView()
    }
}
