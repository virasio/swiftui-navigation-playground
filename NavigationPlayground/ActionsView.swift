//
//  ActionsView.swift
//  NavigationPlayground
//
//  Created by Victor Surikov on 25.12.2024.
//

import SwiftUI

struct ActionsView: View {
    @State var model: ScreenModel
    @Binding var path: NavigationPath

    @State private var showSheet: Bool = false
    @State private var showFullScreenCover: Bool = false
    @State private var showPopover: Bool = false

    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("NavigationPath Navigation")
                .font(.headline)
                .padding(.horizontal, 16)
                .frame(minHeight: 40)
                .padding(.top, 8)

            NavigationLink(value: model.nextItem) {
                ActionView("NavigationLink")
            }

            Button {
                path.append(model.nextItem)
            } label: {
                ActionView("Programmatically Appending")
            }

            Text("Modal Presentation")
                .font(.headline)
                .padding(.horizontal, 16)
                .frame(minHeight: 40)
                .padding(.top, 8)

            Button {
                showSheet.toggle()
            } label: {
                ActionView("Sheet")
            }

            Button {
                showFullScreenCover.toggle()
            } label: {
                ActionView("Full Screen Cover")
            }

            Button {
                showSheet.toggle()
            } label: {
                ActionView("Popover")
            }

            Spacer(minLength: 0)
        }
        .foregroundStyle(.primary)
        .padding(.vertical, 20)
        .background(.background)
        .cornerRadius(20)
        .padding(20)
        .frame(maxHeight: .infinity)
        .fixedSizeScrollView(.vertical)
        .background(model.color)
        .navigationTitle(model.title)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            if !path.isEmpty {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        path.removeLast(path.count)
                    } label: {
                        Text(Image(systemName: "chevron.backward.2"))
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        path.removeLast()
                    } label: {
                        Text(Image(systemName: "chevron.backward"))
                    }
                }
            }
        }
        .sheet(isPresented: $showSheet) {
            NavigationContainerView(screenModel: model.nextLevel)
        }
        .fullScreenCover(isPresented: $showFullScreenCover) {
            NavigationContainerView(screenModel: model.nextLevel)
        }
        .popover(isPresented: $showPopover) {
            NavigationContainerView(screenModel: model.nextLevel)
        }
    }
}

@available(iOS 17.0, *)
#Preview {
    @Previewable @State var path: NavigationPath = .init()
    NavigationStack {
        ActionsView(model: ScreenModel(color: .red, level: [0]), path: $path)
    }
}
