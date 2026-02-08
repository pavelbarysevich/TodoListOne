import SwiftUI

struct ListRow: View {
    
    var item: ItemModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle" )
                .foregroundStyle(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 5)
    }
}

#Preview {
    NavigationStack {
        ListRow(item: .init(title: "Первый пост", isCompleted: true))
        ListRow(item: .init(title: "Второй пост", isCompleted: false))
    }
}
