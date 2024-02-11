//
//  TaskarooApp.swift
//  Taskaroo
//
//  Created by Batuhan Akdemir on 11.01.2024.
//


import SwiftUI
import SwiftData

@main
struct TaskarooApp: App {
    
    let container: ModelContainer
    @State private var viewModel: ListViewModel

    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ListView()
            }
            .environment(viewModel)
        }
        .modelContainer(container)
    }

    init() {
        do {
            container = try ModelContainer(for: ItemModel.self)
            let viewModel = ListViewModel(modelContext: container.mainContext)
            _viewModel = State(initialValue: viewModel)
        } catch {
            fatalError("Failed to create ModelContainer for Movie.")
        }
    }
}
