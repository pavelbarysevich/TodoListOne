import SwiftUI

struct ListView: View {
    
    @State var items: [ItemModel] = [
        ItemModel(title: "Первый пост", isCompleted: true),
        ItemModel(title: "Второй пост", isCompleted: false),
        ItemModel(title: "Третий пост", isCompleted: true)
    ]
    
    var body: some View {
        List {
            ForEach(items) { item in
                ListRow(item: item)
            }
        }
        .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        EditButton()
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink("Добавить", destination: AddListView())

                    }
                }
        .listStyle(.plain)
        .navigationTitle("Задачи 🖊️")
    }
}

#Preview {
    NavigationStack {
        ListView()
    }
}

