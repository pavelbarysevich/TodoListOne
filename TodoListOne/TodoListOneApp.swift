import SwiftUI

@main
struct TodoListOneApp: App {
    
   @State var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ListView()
            }
            .environment(listViewModel)
        }
    }
}
