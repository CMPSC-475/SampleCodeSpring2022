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
}
