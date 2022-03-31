//
//  TopManager+async.swift
//  Top Apps
//
//  Created by Nader Alfares on 3/29/22.
//
import Foundation

extension TopAppManager {
    func asyncRetrieveData() async {
        let urlSession = URLSession.shared
        let url = URL(string: urlString)!
        do {
            let (data, response) = try await urlSession.data(from: url)
            
            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                 //TODO: Handle Error
                
                DispatchQueue.main.sync{
                    self.httpError = true
                }
                return
            }
            let _topApps = self.appFrom(data: data)
            
            DispatchQueue.main.sync {
                self.topApps = _topApps
            }
            await asyncReetriveImages()
        } catch {
            print(error)
        }
    }
    
    // Retriving images
    func asyncReetriveImages() async {
        let urlSession = URLSession.shared
        for i in topApps.indices {
            
            let url = URL(string: topApps[i].imageURL)!
            
            do {
                let (data, _ ) = try await urlSession.data(from: url)
                DispatchQueue.main.async {
                    self.topApps[i].addImageData(data)
                }
                
            } catch {
                print(error)
            }
        }
    }
    
    // helper method to get image for application indexed at i
    func asyncRetriveImage(index i: Int ) async throws -> Data {
        let url = URL(string: topApps[i].imageURL)!
        let (data, _ ) = try await URLSession.shared.data(from: url)
        return data
    }
    
    
}
    
