//
//  TopAppsList.swift
//  Top Apps
//

import SwiftUI

struct TopAppsList: View {
    @EnvironmentObject var manager : TopAppManager

    var body: some View {
        NavigationView {
            List {
                ForEach(manager.topApps) {app in
                    NavigationLink(
                        destination: AppDetails(appInfo: app),
                        label: {
                            AppRow(appInfo: app)
                        })

                }
            }
            .overlay(alignment: .top, content: {
                if manager.httpError != nil {
                    ErrorView(error: $manager.httpError)
                }
            })
            .refreshable {
                await manager.asyncRetrieveData()
            }
            
//            .alert("HTTP ERROR", isPresented: $manager.httpError, actions: {
//                Button("Try Again") {
//                }
//                Button("Cancel", role: .cancel){}
//            })
            .navigationTitle(Text("Top Apps"))

        }
    }
}

struct TopAppsList_Previews: PreviewProvider {
    static var previews: some View {
        TopAppsList()
    }
}
