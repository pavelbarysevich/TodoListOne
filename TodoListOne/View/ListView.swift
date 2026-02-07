import SwiftUI

struct ListView: View {
    
    @State var items: [String] = [
        "Первый",
        "Второй",
        "Треций"
    ]
    
    var body: some View {
        List {
            ForEach(items, id: \.self) { item in
                ListRow(title: item)
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

