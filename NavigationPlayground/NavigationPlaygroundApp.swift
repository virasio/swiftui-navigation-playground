//
//  NavigationPlaygroundApp.swift
//  NavigationPlayground
//
//  Created by Victor Surikov on 24.12.2024.
//

import SwiftUI

@main
struct NavigationPlaygroundApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationContainerView(screenModel: ScreenModel(color: .random(), level: [0]))
        }
    }
}
