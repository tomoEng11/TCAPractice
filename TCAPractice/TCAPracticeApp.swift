//
//  TCAPracticeApp.swift
//  TCAPractice
//
//  Created by 井本智博 on 2024/08/18.
//

import SwiftUI
import ComposableArchitecture

@main
struct TCAPracticeApp: App {
    var body: some Scene {
        WindowGroup {
            AlertView(store: Store(initialState: AlertReducer.State(), reducer: {
                AlertReducer()
                    ._printChanges()
            }))
        }
    }
}
