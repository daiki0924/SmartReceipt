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
        // 領収書一覧
        let receiptListViewController = ReceiptListViewController()
        let naviReceiptList = UINavigationController(rootViewController: receiptListViewController)
        naviReceiptList.tabBarItem = UITabBarItem(title: "一覧", image: UIImage(systemName: "list.bullet.rectangle"), tag: 0)
        
        // 領収書スキャン
        let scanReceiptViewController = ScanReceiptViewController()
        scanReceiptViewController.tabBarItem = UITabBarItem(title: "スキャン", image: UIImage(systemName: "camera.fill"), tag: 1)
        
        // カテゴリ管理
        let categoryManagementViewController = CategoryManagementViewController()
        let naviCategoryManagement = UINavigationController(rootViewController: categoryManagementViewController)
        naviCategoryManagement.tabBarItem = UITabBarItem(title: "カテゴリ", image: UIImage(systemName: "folder.fill"), tag: 2)
        
        // 分析
        let expenseAnalysisViewController = ExpenseAnalysisViewController()
        let naviExpenseAnalysis = UINavigationController(rootViewController: expenseAnalysisViewController)
        naviExpenseAnalysis.tabBarItem = UITabBarItem(title: "分析", image: UIImage(systemName: "chart.bar.fill"), tag: 3)
        
        // 設定
        let settingsViewController = SettingsViewController()
        let naviSettings = UINavigationController(rootViewController: settingsViewController)
        naviSettings.tabBarItem = UITabBarItem(title: "設定", image: UIImage(systemName: "gearshape.fill"), tag: 4)
        
        viewControllers = [
            naviReceiptList,
            scanReceiptViewController,
            naviCategoryManagement,
            naviExpenseAnalysis,
            naviSettings
        ]
    }
}
