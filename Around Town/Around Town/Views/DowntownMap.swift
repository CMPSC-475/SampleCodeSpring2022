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
    @State var showConfirmationDialog : Bool = false
    
    var body: some View {
        Map(coordinateRegion: $manager.region, annotationItems: manager.locationModel.favorites, annotationContent: annotationFor(spot:))
//            .actionSheet(item: $spot) { _spot in
//                ActionSheet(title: Text("\(_spot.title!)"), buttons: [Alert.Button.cancel()])
//            }
            .confirmationDialog("Select an Action", isPresented: $showConfirmationDialog, presenting: spot, actions: { _spot in
                VStack{
                    Button("Directions to \(_spot.title ?? "Nowhere")"){}
                    Button("Delete", role: .destructive) {}
                    Button("Cancel", role: .cancel) {}
                }
            }, message: {sp in
                Text(spot?.title ?? "No Title")
            })
    }
    

}

extension DowntownMap {
    func markerFor(spot: Spot) -> some MapAnnotationProtocol {
        MapMarker(coordinate: spot.coordinate, tint: .blue)
    }
    
    func annotationFor(spot: Spot) -> some MapAnnotationProtocol {
        MapAnnotation(coordinate: spot.coordinate) {
            Button(action: {
                self.spot = spot
                self.showConfirmationDialog = true
            }) {
                Image(systemName: "mappin.circle.fill")
                    .scaleEffect(2.0)
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
