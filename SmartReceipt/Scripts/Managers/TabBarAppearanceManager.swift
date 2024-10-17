//
//  TabBarAppearanceManager.swift
//  SmartReceipt
//
//  Created by Daiki Kobayashi on 2024/10/17.
//

import UIKit

struct TabBarAppearanceManager {
    /// TabBar設定
    static func configure() {
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithTransparentBackground()
        tabBarAppearance.stackedLayoutAppearance.normal.iconColor = UIColor(named: "color_navy_2C3E50")
        tabBarAppearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor(named: "color_navy_2C3E50")!]
        tabBarAppearance.stackedLayoutAppearance.selected.iconColor = UIColor(named: "color_blue_00AEEF")
        tabBarAppearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor(named: "color_blue_00AEEF")!]
        UITabBar.appearance().standardAppearance = tabBarAppearance
        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
    }
}
