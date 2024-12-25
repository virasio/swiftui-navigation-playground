//
//  ActionView.swift
//  NavigationPlayground
//
//  Created by Victor Surikov on 25.12.2024.
//

import SwiftUI

struct ActionView: View {
    private let text: String

    var body: some View {
        HStack(alignment: .firstTextBaseline) {
            Text(text)
            Spacer(minLength: 8)
            Image(systemName: "chevron.forward")
        }
        .font(.body)
        .foregroundStyle(.primary)
        .padding(.vertical, 8)
        .padding(.horizontal, 16)
        .frame(minHeight: 40)
    }

    init(_ text: String) {
        self.text = text
    }
}

#Preview {
    ActionView("Very long text that should wrap to next line and overflow container")
        .background(.background)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.blue)
}
