import SwiftUI

struct AddListView: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(ListViewModel.self) private var listViewModel
    @State var newTask: String = ""
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
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
        .alert(isPresented: $showAlert) {
            getAlet()
        }
    }
    
    func saveButtonTask() {
        if textChecking() {
            listViewModel.addItem(title: newTask)
            dismiss()
        }
    }
    
    func textChecking() -> Bool {
        if newTask.count < 3 {
            alertTitle = "Список задач должен содержать минимум 3 символа 😎"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlet () -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

#Preview {
    NavigationStack {
        AddListView()
    }
    .environment(ListViewModel())
}
