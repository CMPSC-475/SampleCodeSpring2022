//
//  TaskList.swift
//  Do It Now
//
//  Created by jjh9 on 10/11/21.
//

import SwiftUI

struct TaskList: View {
    @EnvironmentObject var manager : TaskManager
    
    var body: some View {
        NavigationView {
            List {
                ForEach($manager.items) {$item in
                    ItemRow(item: $item)
                        
                }
                .onDelete { index in
                    manager.deleteItem(indexSet: index)
                }
                .onMove { index, offset in
                    manager.move(fromOffsets: index, toOffset: offset)
                }
            }
            
            .navigationTitle("Do It Now")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    EditButton()
                }
                
                
            }
        }
    }
}

struct TaskList_Previews: PreviewProvider {
    static var previews: some View {
        TaskList()
    }
}
