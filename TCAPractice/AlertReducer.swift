//
//  AlertReducer.swift
//  TCAPractice
//
//  Created by 井本智博 on 2024/08/18.
//

import Foundation
import ComposableArchitecture

@Reducer
struct AlertReducer {
    @ObservableState
    struct State: Equatable {
        @Presents var alert: AlertState<Action.Alert>?
    }

    enum Action {
        case addButtonTapped
        case alert(PresentationAction<Alert>)

        enum Alert: Equatable {
            case confirmButtonTapped
        }
    }

    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .addButtonTapped:
                state.alert = AlertState {
                    TextState("hello")
                } actions: {
                    ButtonState(role: .cancel) {
                        TextState("キャンセル")
                    }
                    ButtonState(role: .destructive, action: .confirmButtonTapped) {
                        TextState("Dismiss")
                    }
                } message: {
                    TextState("どうする？")
                }
                return .none

            case .alert(.presented(.confirmButtonTapped)):
                state.alert = nil
                return .none
            case .alert:
                return .none
            }
        }
        .ifLet(\.$alert, action: \.alert)
    }
}
