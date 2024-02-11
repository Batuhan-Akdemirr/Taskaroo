//
//  ListViewModel.swift
//  Taskaroo
//
//  Created by Batuhan Akdemir on 11.01.2024.
//

import Foundation
import SwiftData

@Observable
class ListViewModel {
    
    var modelContext: ModelContext
    var items = [ItemModel]()
    
    
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
        fetchData()
    }
    
    func fetchData() {
              do {
                  let descriptor = FetchDescriptor<ItemModel>(sortBy: [SortDescriptor(\.title)])
                  items = try modelContext.fetch(descriptor)
              } catch {
                  print("Fetch failed")
              }
          }
    
    
    func deleteItem(at offsets: IndexSet) {
        for offset in offsets {
                let item = items[offset]
                modelContext.delete(item)
            }
        fetchData()
    }
    
    func moveItem(from: IndexSet , to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        modelContext.insert(newItem)
        fetchData()
    }
    
    func updateItem(item: ItemModel) {
          if let index = items.firstIndex(where: { $0.id == item.id }) {
              items[index].isCompleted = !items[index].isCompleted
          }
      }
}
