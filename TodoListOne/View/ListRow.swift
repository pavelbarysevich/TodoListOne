import SwiftUI

/*
 ListRow — компонент строки для отображения элемента списка.
 Показывает иконку состояния, текст и визуально различает завершённые и активные элементы.
 
 - item: ItemModel — данные одного элемента (например, задачи)
   - title: Название задачи или элемента
   - isCompleted: Флаг выполненности
*/

struct ListRow: View {
    /// Модель данных одного элемента списка
    var item: ItemModel
    
    var body: some View {
        HStack {
            // Иконка состояния: галочка в кружке для завершённых, пустой круг для активных
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle" )
                // Цвет иконки (в данном случае всегда акцентный)
                .foregroundStyle(item.isCompleted ? .accent : .accent)
            // Текст названия элемента; перечёркивается, если выполнен
            Text(item.title)
                .strikethrough(item.isCompleted, color: .accent)
            // Spacer для выравнивания содержимого в строке
            Spacer()
        }
        // Размер шрифта для всей строки
        .font(.title2)
        // Вертикальные отступы для лучшей читаемости
        .padding(.vertical, 5)
    }
}

#Preview {
    NavigationStack {
        ListRow(item: .init(title: "Первый пост", isCompleted: true))
        ListRow(item: .init(title: "Второй пост", isCompleted: false))
    }
}
