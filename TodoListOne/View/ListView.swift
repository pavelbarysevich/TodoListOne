import SwiftUI

struct ListView: View {
    @Environment(ListViewModel.self) private var listViewModel
    
    var body: some View {
        List {
            ForEach(listViewModel.items) { item in
                ListRow(item: item)
            }
            .onDelete(perform: listViewModel.onDelete)
            .onMove(perform: listViewModel.onMove)
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
    .environment(ListViewModel())
}

