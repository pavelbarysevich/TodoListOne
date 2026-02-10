import SwiftUI
internal import Combine

@Observable class ListViewModel {
    
    var items: [ItemModel] = []
    
    init() {
        getItems()
    }
    
    func getItems() {
        let newItems = [
            ItemModel(title: "Первый пост", isCompleted: true),
            ItemModel(title: "Второй пост", isCompleted: false),
            ItemModel(title: "Третий пост", isCompleted: true)
        ]
        items.append(contentsOf: newItems)
    }
    
    func onDelete(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func onMove (from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item: ItemModel) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item.updateCompletion()
        }
    }
}

