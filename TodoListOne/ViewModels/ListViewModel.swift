import SwiftUI
import Observation

// Класс ViewModel для управления списком задач (To-Do). Отвечает за хранение, изменение, удаление, перемещение и сохранение задач
@Observable class ListViewModel {
    // Массив задач. При каждом изменении автоматически сохраняется в память
    var items: [ItemModel] = [] {
        didSet {
            saveItems()
        }
    }
    // Ключ для хранения списка задач в UserDefaults
    let itemsKey: String = "items_list"
    
    // При инициализации происходит загрузка задач из памяти
    init() {
        getItems()
    }
    
    // Загружает задачи из UserDefaults (если данные есть), иначе оставляет список пустым
    func getItems() {
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let saveItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }
        
        self.items = saveItems
    }
    
    // Удаляет задачи по индексам (например, после свайпа в списке)
    func onDelete(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    // Перемещает задачи внутри списка (drag and drop)
    func onMove (from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    // Добавляет новую задачу с заданным заголовком (изначально не выполнена)
    func addItem(title: String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    // Инвертирует статус выполнения задачи по id (выполнена/не выполнена)
    func updateItem(item: ItemModel) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item.updateCompletion()
        }
    }
    
    // Сохраняет текущий список задач в UserDefaults (как JSON)
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
}

