//
//  DiningPicker.swift
//  Around Town
//
//  Created by Nader Alfares on 2/24/22.
//
import SwiftUI

struct DiningPicker: View {
    @EnvironmentObject var manager : MapManager
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
            Picker(selection: $manager.selectedRestaurantIndex, label:Image(systemName: "map")) {
                ForEach(manager.restaurants.indices, id:\.self) {index in
                    //Text(manager.restaurants[index].name)
                    Label(manager.restaurants[index].name, systemImage: "fork.knife.circle")
                }

            }.pickerStyle(DefaultPickerStyle())
            .onSubmit {
               print("here")
            }
        
    }

}

struct DiningPicker_Previews: PreviewProvider {
    static var previews: some View {
        DiningPicker()
    }
}
