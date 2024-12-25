//
//  NavigationContainerView.swift
//  NavigationPlayground
//
//  Created by Victor Surikov on 25.12.2024.
//

import SwiftUI

struct NavigationContainerView: View {
    @State var screenModel: ScreenModel
    @State private var path = NavigationPath()

    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationStack(path: $path) {
            ActionsView(model: screenModel, path: $path)
                .navigationDestination(for: ScreenModel.self) { model in
                    ActionsView(model: model, path: $path)
                        .toolbar {
                            closeToolbarButton(for: model)
                        }
                }
                .toolbar {
                    closeToolbarButton(for: screenModel)
                }
        }
    }

    @ViewBuilder
    private func closeToolbarButton(for model: ScreenModel) -> some View {
        if model.level.count > 1 {
            Button {
                dismiss()
            } label: {
                Text(Image(systemName: "xmark"))
            }
        }
    }
}

#Preview {
    NavigationContainerView(screenModel: ScreenModel(color: .random(), level: [0]))
}
