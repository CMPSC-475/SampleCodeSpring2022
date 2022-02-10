//
//  HomeView.swift
//  US States
//
//  Created by Hannan, John Joseph on 9/12/21.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var stateManager : StateManager
    @State var showPreferences : Bool = false
    @AppStorage(Storage.sectioning) var sectioning : Sectioning = .none
    @AppStorage(Storage.homeStateIndex) var homeStateIndex : Int?
    var sectionInfos : [SectionInfo] { stateManager.sectionInfo(for: sectioning)}
    
    var body: some View {
        NavigationView {
            List {
                //TODO: Add HomeStateView if Selected
                if let index = homeStateIndex {
                    Section(header: CustomHeader(text: "Home State")) {
                        HomeStateView(state: stateManager.stateModel.states[index])
                    }
                }
                
                
                // Show visited states
                if stateManager.visitedStates.count > 0 {
                    Section(header: CustomHeader(text:"Visited States")) {
                        StatesScrollView(states: stateManager.visitedStates)
                    }
                }
                // Show favorite states
                if stateManager.favoriteStates.count > 0 {
                    Section(header: CustomHeader(text:"Favorite States")) {
                        StatesScrollView(states: stateManager.favoriteStates)
                    }
                }
                
                //show all states
                if sectioning == .none {
                    Section(header: CustomHeader(text:"All States")){
                    SectionView(indices: stateManager.allIndicies)
                    }
                } else {
                    ForEach(sectionInfos) { sectionInfo in
                        Section(header: CustomHeader(text: sectionInfo.title)) {
                            SectionView(indices: sectionInfo.indicies)
                        }
                    }
                }
                
            }
            .sheet(isPresented: $showPreferences) {
                PreferenceView(showingPreferences: $showPreferences)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {showPreferences.toggle()}, label: {
                        Image(systemName: "slider.horizontal.3")
                    })
                }
            }
            .navigationBarTitle(Text("US States"))
        }

        .navigationViewStyle(StackNavigationViewStyle())

    }
}


struct HomeStateView : View {
    var state : USState?
    var body : some View {
        VStack {
            if let state = state {
                Image(state.image)
                    .resizable()
                    .scaledToFill()
                    .frame(height:200)
                    .padding()
                Text(state.name)
                    .font(.title)
                    .padding()
                    
            } else {
                EmptyView()
            }
        }
    }
}




struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(showPreferences: true)
    }
}
