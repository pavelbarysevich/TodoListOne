import SwiftUI

struct ListRow: View {
    
    var title: String
    
    var body: some View {
        HStack {
            Image(systemName: "checkmark.circle")
            Text(title)
            Spacer()
        }
    }
}

#Preview {
    NavigationStack {
        ListRow(title: "Новый пост")
    }
}
