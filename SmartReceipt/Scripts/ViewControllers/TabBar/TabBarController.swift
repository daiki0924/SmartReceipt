//
//  TabBarController.swift
//  SmartReceipt
//
//  Created by Daiki Kobayashi on 2024/10/17.
//

import UIKit

final class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewControllers()
    }
    
    private func configureViewControllers() {
        let homeViewController = HomeViewController()
        let naviHome = UINavigationController(rootViewController: homeViewController)
        naviHome.tabBarItem = UITabBarItem(title: "ホーム", image: UIImage(systemName: ""), tag: 0)
        
        let receiptHistoryViewController = ReceiptHistoryViewController()
        let naviReceiptHistory = UINavigationController(rootViewController: receiptHistoryViewController)
        naviReceiptHistory.tabBarItem = UITabBarItem(title: "履歴", image: UIImage(systemName: ""), tag: 1)
        
        let exportViewController = ExportViewController()
        let naviExport = UINavigationController(rootViewController: exportViewController)
        naviExport.tabBarItem = UITabBarItem(title: "出力", image: UIImage(systemName: ""), tag: 2)
        
        let settingViewController = SettingViewController()
        let naviSetting = UINavigationController(rootViewController: settingViewController)
        naviSetting.tabBarItem = UITabBarItem(title: "設定", image: UIImage(systemName: ""), tag: 3)
        
        viewControllers = [
            naviHome,
            naviReceiptHistory,
            naviExport,
            naviSetting,
        ]
    }
}
