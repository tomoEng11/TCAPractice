//
//  AlertView.swift
//  TCAPractice
//
//  Created by 井本智博 on 2024/08/18.
//

import SwiftUI
import ComposableArchitecture

struct AlertView: View {
    @Bindable var store: StoreOf<AlertReducer>

    var body: some View {
        VStack {
            Button(action: {
                store.send(.addButtonTapped)
            }, label: {
                Text("Button")
            })
        }
        .alert($store.scope(state: \.alert, action: \.alert))
    }
}
