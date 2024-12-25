//
//  ScreenModel.swift
//  NavigationPlayground
//
//  Created by Victor Surikov on 25.12.2024.
//

import SwiftUI

final class ScreenModel: Identifiable {
    let id: UUID = UUID()

    let color: Color
    let level: [Int]

    lazy private(set) var title: String = {
        "Level \(level.map(String.init).joined(separator: "."))"
    }()

    lazy private(set) var nextItem: ScreenModel = makeNextItem()
    lazy private(set) var nextLevel: ScreenModel = makeNextLevel()

    init(color: Color, level: [Int]) {
        self.color = color
        self.level = level
    }
}

extension ScreenModel: Hashable {
    static func == (lhs: ScreenModel, rhs: ScreenModel) -> Bool {
        lhs.color == rhs.color && lhs.level == rhs.level
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(color)
        hasher.combine(level)
    }
}

private extension ScreenModel {
    func makeNextItem() -> ScreenModel {
        var nextLevel = level
        let lastValue = nextLevel.removeLast()
        nextLevel.append(lastValue + 1)
        return ScreenModel(color: .random(), level: nextLevel)
    }

    func makeNextLevel() -> ScreenModel {
        var nextLevel = level
        nextLevel.append(0)
        return ScreenModel(color: .random(), level: nextLevel)
    }
}

extension Color {
    static func random() -> Color {
        Color.init(hue: Double.random(in: 0...1), saturation: 0.8, brightness: 0.8)
    }
}
