//
//  TopAppManager.swift
//  Top Apps
//


import Foundation

class TopAppManager : ObservableObject{
    // downloaded app information
    @Published var topApps = [AppInfo]()
    
    
    //json feed from Apple for Top Paid Apps
    let urlString = "https://itunes.apple.com/us/rss/toppaidapplications/limit=100/json"

    //TODO: retrive app data
    init() {
        retrieveData()
    }
    
    // find index of an app
    func index(for app:AppInfo) -> Int? {
        topApps.firstIndex(where: {app.id == $0.id})
    }
    
    func appFrom(data: Data) -> [AppInfo] {
        let _topApps : [AppInfo]
        let decoder = JSONDecoder()
        do {
            let apps = try decoder.decode(TopAppData.self, from: data)
            let entries = apps.feed.entry
            _topApps = entries.map {AppInfo(entry: $0)}
        } catch {
            _topApps = []
        }
        return _topApps
    }
}
