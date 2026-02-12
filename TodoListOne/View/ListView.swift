import SwiftUI

struct ListView: View {
    @Environment(ListViewModel.self) private var listViewModel
    
    var body: some View {
        ZStack {
            if listViewModel.items.isEmpty {
                NoItemsView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            } else {
                List {
                    ForEach(listViewModel.items) { item in
                        ListRow(item: item)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    listViewModel.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.onDelete)
                    .onMove(perform: listViewModel.onMove)
                }
                .listStyle(.plain)
            }
            
        }
        .navigationTitle("Задачи 🖊️")
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                EditButton()
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink("Добавить", destination: AddListView())
                
            }
        }
    }
}

#Preview {
    NavigationStack {
        ListView()
    }
    .environment(ListViewModel())
}

