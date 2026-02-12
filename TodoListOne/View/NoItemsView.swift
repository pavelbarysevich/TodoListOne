import SwiftUI

struct NoItemsView: View {
    
    @State var animate: Bool = false
    
    var body: some View {
        ScrollView {
            VStack (spacing: 10) {
                Text("Элементов нет")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Вы продуктивный человек? Думаю, вам стоит нажать кнопку и добавить несколько пунктов в свой список дел!")
                    .padding(.bottom, 30)
                NavigationLink {
                    AddListView()
                } label: {
                    Text("Добавить задачу 📋")
                        .foregroundStyle(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(animate ? .X_2 : .accent)
                        .cornerRadius(20)
                }
                .padding(.horizontal, animate ? 30 : 50)
                .shadow(color: animate ? .X_2.opacity(0.7) : .accent.opacity(0.7),
                        radius: animate ? 30 : 10,
                        x: 0,
                        y: animate ? 50 : 30)
                .scaleEffect(animate ? 1.1 : 1.0)
                .offset(y: animate ? -7 : 0)

            }
            .frame(maxWidth: 400)
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        
    }
    
    func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now(), execute: {
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ) {
                animate.toggle()
            }
        })
    }
}

#Preview {
    NavigationStack {
        NoItemsView()
            .navigationTitle("Title")
    }
    
}
