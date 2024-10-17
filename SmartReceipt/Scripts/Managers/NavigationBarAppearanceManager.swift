//
//  NavigationBarAppearanceManager.swift
//  SmartReceipt
//
//  Created by Daiki Kobayashi on 2024/10/17.
//

import UIKit

struct NavigationBarAppearanceManager {
    /// // NavigationBar設定
    static func configure() {
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithOpaqueBackground()
        navigationBarAppearance.backgroundColor = UIColor(named: "color_navy_2C3E50")
        navigationBarAppearance.titleTextAttributes = [.foregroundColor: UIColor(named: "color_white_FFFFFF")!]
        UINavigationBar.appearance().standardAppearance = navigationBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
        UINavigationBar.appearance().compactAppearance = navigationBarAppearance
        UINavigationBar.appearance().compactScrollEdgeAppearance = navigationBarAppearance
    }
}
