//
//  TopManager+Operations.swift
//  Top Apps
//
//  Created by Nader Alfares on 3/24/22.
//

import Foundation

extension TopAppManager {
    
    func retriveWithOperations(){
        let url = URL(string: urlString)!
        let queue = OperationQueue()
        
        let manifestOperation = BlockOperation {
            let data = try? Data(contentsOf: url)
            if let data = data {
                let _topApps = self.appFrom(data: data)
                DispatchQueue.main.sync {
                    self.topApps = _topApps
                }
            }
            
        }
        
        let imageOperation = BlockOperation {
            for i in self.topApps.indices {
                let operation = BlockOperation {
                    let url = URL(string: self.topApps[i].imageURL)!
                    let data = try! Data(contentsOf: url)
                    DispatchQueue.main.sync {
                        self.topApps[i].imageData = data
                    }
                }
                
                queue.addOperation(operation)
                
            }
        }
        
        queue.addOperation(manifestOperation)
        imageOperation.addDependency(manifestOperation)
        queue.addOperation(imageOperation)
        
    }
    
    
    
}
