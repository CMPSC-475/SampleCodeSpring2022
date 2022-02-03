//
//  ListView.swift
//  SwiftUI Examples
//
//  Created by Nader Alfares on 2/2/22.
//

import SwiftUI

struct ListView: View {
    let names = ["Ann", "Bob", "Carla", "Don", "Elle", "Fred", "Gina", "Harry"]
    let range = 1..<100
    let numbers = [1,2,3,4,5,6,7,8]
    
    var body: some View {
        Text("List View")
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
