//
//  DowntownMap.swift
//  Downtown
//
//  Created by Hannan, John Joseph on 9/27/21.
//

import SwiftUI
import MapKit


struct DowntownMap: View {
    @EnvironmentObject var manager : MapManager
    @State var spot : Spot?
    
    var body: some View {
        Map(coordinateRegion: $manager.region, annotationItems: manager.locationModel.favorites, annotationContent: annotationFor(spot:))
            .actionSheet(item: $spot) { _spot in
                ActionSheet(title: Text("\(_spot.title!)"), buttons: [Alert.Button.cancel()])
            }
    }
    
    func markerFor(spot: Spot) -> some MapAnnotationProtocol {
        MapMarker(coordinate: spot.coordinate, tint: .blue)
    }
    
    func annotationFor(spot: Spot) -> some MapAnnotationProtocol {
        MapAnnotation(coordinate: spot.coordinate) {
            Button(action: {self.spot = spot}) {
                Image(systemName: "mappin")
            }
        }
    }
}

struct DowntownMap_Previews: PreviewProvider {
    static var previews: some View {
        DowntownMap()
            .environmentObject(MapManager())
    }
}
