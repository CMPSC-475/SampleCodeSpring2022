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
    @State var selectedPlace : Place?
    @State var showConfirmationDialog : Bool = false
    @State var showDetails = false
    @State var userTrackingMode : MapUserTrackingMode = .follow
    
    var body: some View {
    
        VStack {
            NavigationLink(destination: PlaceView(place: $selectedPlace), isActive: $showDetails,  label: {EmptyView()})
        
        //Map(coordinateRegion: $manager.region, annotationItems: manager.places, annotationContent: menuFor(place:))
            
            Map(coordinateRegion: $manager.region, interactionModes: .all, showsUserLocation: manager.showsUserLocation, userTrackingMode: $userTrackingMode, annotationItems: manager.places , annotationContent: menuFor(place:) )
            .ignoresSafeArea()
        }
    }
    

}

extension DowntownMap {    
    func menuFor(place: Place) -> some MapAnnotationProtocol {
        MapAnnotation(coordinate: place.coordinate) {
            Image(manager.imageFor(category: place.category!))
                .scaleEffect(1.5)
                .contextMenu {
                    //Text(spot.title!)
                    Button(action: {
                        self.selectedPlace = place
                        self.showDetails = true

                    }, label: {
                        Label("Details", systemImage: "info")
                    })
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
