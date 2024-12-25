//
//  FixedSizeScrollView.swift
//  NavigationPlayground
//
//  Created by Victor Surikov on 25.12.2024.
//

import SwiftUI

struct FixedSizeScrollView: ViewModifier {
    let axis: Axis.Set

    init(axis: Axis.Set) {
        self.axis = axis
    }

    func body(content: Content) -> some View {
        ViewThatFits(in: axis) {
            content
            ScrollView(axis) {
                content
            }
        }
    }
}

extension View {
    func fixedSizeScrollView(_ axis: Axis.Set = .vertical) -> some View {
        modifier(FixedSizeScrollView(axis: axis))
    }
}
