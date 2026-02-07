//
//  TodoListOneApp.swift
//  TodoListOne
//
//  Created by Павел Борисевич on 6.02.26.
//

import SwiftUI

@main
struct TodoListOneApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ListView()
            }
        }
    }
}
