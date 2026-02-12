//
//  TodoListOneApp.swift
//  TodoListOne
//
//  Created by Павел Борисевич on 6.02.26.
//

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
