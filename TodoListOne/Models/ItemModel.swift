import SwiftUI

// Модель элемента списка задач для SwiftUI, поддерживает идентификацию и кодирование
struct ItemModel: Identifiable, Codable {
    // Уникальный идентификатор элемента (используется для различения в списках SwiftUI)
    var id: String
    // Название или описание задачи
    var title: String
    // Статус задачи: true — завершена, false — активна
    var isCompleted: Bool
    
    // Инициализатор позволяет явно задать все поля. id генерируется автоматически, если не передан
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    // Возвращает новую копию элемента с инвертированным статусом выполнения (value semantics)
    func updateCompletion() -> ItemModel {
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
}



