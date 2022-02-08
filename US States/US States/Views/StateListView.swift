//
//  StateListView.swift
//  US States
//
//  Created by jjh9 on 9/14/21.
//

import SwiftUI

struct StateListView: View {
    @EnvironmentObject var manager : StateManager
    @AppStorage(Storage.sectioning) var sectioning : Sectioning = .none
    @Binding var showPreferences : Bool
    var sectionInfos : [SectionInfo] { manager.sectionInfo(for: sectioning)}
    var body: some View {
            List {
                if sectioning == .none {
                    SectionView(indices: manager.allIndicies)
                } else {
                    ForEach(sectionInfos) { sectionInfo in
                        Section(header: CustomHeader(text: sectionInfo.title)) {
                            SectionView(indices: sectionInfo.indicies)
                        }
                    }
                }
            }
            .navigationTitle("US States")
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
    }
}

struct StateListView_Previews: PreviewProvider {
    static var previews: some View {
        StateListView(showPreferences: .constant(false))
            .environmentObject(StateManager())
    }
}
