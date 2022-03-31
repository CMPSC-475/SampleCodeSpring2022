//
//  TopAppManager+CompletionBlocks.swift
//  Top Apps
//
//  Created by Nader Alfares on 3/22/22.
//

import Foundation


extension TopAppManager {
    
    //MARK: - Retriving Data
    func retrieveData() {
        let urlSession = URLSession.shared
        let url = URL(string: urlString)!
        
        let task = urlSession.dataTask(with: url) { data, response, error in
            guard (error == nil) else {
                //TODO: Handle Error
                return
            }
            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                 //TODO: Handle Error
                
                DispatchQueue.main.sync{
                    //self.httpError = true
                }
                
                
                 return
             }
            let _topApps = self.appFrom(data: data!)
            
            DispatchQueue.main.sync {
                self.topApps = _topApps
            }
        }
        
        task.resume()
    }
    
    
    //MARK: - Retriving Images
    func retriveImages(){
        for i in topApps.indices {
            appImageFor(index: i)
        }
    }
    
    func appImageFor(index i: Int) {
        print("get image for index: \(i)")
        let urlSession = URLSession.shared
        let url = URL(string: topApps[i].imageURL)!
        let task = urlSession.downloadTask(with: url) { localUrl, response, error in
            guard (error == nil) else {return}
            if let data = try? Data(contentsOf: localUrl!) {
                DispatchQueue.main.async {
                    self.topApps[i].addImageData(data)
                }
            }
        }
        task.resume()
    }
    
}
