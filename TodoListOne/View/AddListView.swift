import SwiftUI

struct AddListView: View {
    
    @State var newTask: String = ""
    
    var body: some View {
        ScrollView {
            VStack {
                TextField(
                    "",
                    text: $newTask,
                    prompt: Text("Введите новую задачу").foregroundColor(.X_2)
                )
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(.X_1)
                    .cornerRadius(20)
                
                Button {
                    
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
}

#Preview {
    NavigationStack {
        AddListView()
    }
}
