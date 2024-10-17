//
//  ExpenseAnalysisViewController.swift
//  SmartReceipt
//
//  Created by Daiki Kobayashi on 2024/10/17.
//

import UIKit

final class ExpenseAnalysisViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "分析"
    }
}
