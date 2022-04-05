//
//  StorageManger.swift
//  US States
//


import Foundation

class StorageManager<T : Codable > {
    var modelData : [T]
    let filename : String
    let fileInfo : FileInfo
    
    init(filename: String) {
        
        self.filename = filename
        self.fileInfo = FileInfo(for: filename)
        
        if fileInfo.exists {
            let decoder = JSONDecoder()
            do {
                let data = try Data(contentsOf: fileInfo.url)
                modelData = try decoder.decode([T].self, from: data)
            } catch {
                print(error)
                modelData = []
            }
            return
        }
        
        let bundle = Bundle.main
        let url = bundle.url(forResource: filename, withExtension: ".json")
        
        guard let url = url else {modelData = []; return}
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            modelData = try decoder.decode([T].self, from: data)

        } catch {
            print(error)
            modelData = []
        }
    }
    
    func save(modelData:[T]) {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(modelData)
            try data.write(to: fileInfo.url)
        } catch {
            print(error)
        }
    }
    
}

