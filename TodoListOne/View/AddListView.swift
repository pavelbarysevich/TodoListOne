import SwiftUI

struct AddListView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(ListViewModel.self) private var listViewModel
    @State var newTask: String = ""
    
    var body: some View {
        ScrollView {
            VStack {
                TextField(
                    "",
                    text: $newTask,
                    prompt: Text("Введите новую задачу").foregroundColor(.X_2)
                )
                .foregroundColor(.X_2)
                .padding(.horizontal)
                .frame(height: 55)
                .background(.X_1)
                .cornerRadius(20)
                
                Button {
                    saveButtonTask()
                } label: {
                    Text("Добавить".uppercased() )
                }
                .foregroundStyle(.white)
                .font(.headline)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(.X_2)
                .cornerRadius(20)
                
            }
            .padding(20)
            
        }
        .navigationTitle("Новая задача 📋")
    }
    
    func saveButtonTask() {
        listViewModel.addItem(title: newTask)
        dismiss()
    }
}

#Preview {
    NavigationStack {
        AddListView()
    }
    .environment(ListViewModel())
}
