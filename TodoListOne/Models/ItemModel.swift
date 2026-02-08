import SwiftUI

struct ItemModel: Identifiable {
    var id: String = UUID().uuidString
    var title: String
    var isCompleted: Bool
}
