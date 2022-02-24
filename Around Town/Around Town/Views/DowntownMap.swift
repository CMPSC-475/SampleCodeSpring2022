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
    @State var showingPlace = false  // for showing confirmation dialog
    @State var showDetails = false
    @State var userTrackingMode : MapUserTrackingMode = .follow
    
    var body: some View {
    
        VStack {
            NavigationLink(destination: PlaceView(place: $selectedPlace), isActive: $showDetails,  label: {EmptyView()})
        
            
            Map(coordinateRegion: $manager.region, interactionModes: .all, showsUserLocation: manager.showsUserLocation, userTrackingMode: $userTrackingMode, annotationItems: manager.places , annotationContent: annotationFor(place:) )
            .ignoresSafeArea()
            .confirmationDialog("Title",
                                isPresented: $showingPlace,
                                presenting: selectedPlace,
                                actions: { thePlace in
                VStack {
                    Button("Directions to \(thePlace.title)") {manager.provideDirections(for: thePlace)}
                    Button("Delete", role: .destructive) {manager.delete(place: thePlace)}
                }
            }, message: { place in
                Text(place.title)
                
            })
        }
    }

}

extension DowntownMap {
    func menuFor(place: Place) -> some MapAnnotationProtocol {
        MapAnnotation(coordinate: place.coordinate) {
            Image(manager.imageNameFor(category: place.category!))
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
    
    func annotationFor(place:Place) -> some MapAnnotationProtocol {
        MapAnnotation(coordinate: place.coordinate)  {
            Button(action: {showingPlace = true; self.selectedPlace = place})
            {Image(manager.imageNameFor(category: place.category!))}
                   
        }
    }
    
    
}




struct DowntownMap_Previews: PreviewProvider {
    static var previews: some View {
        DowntownMap()
            .environmentObject(MapManager())
    }
}
