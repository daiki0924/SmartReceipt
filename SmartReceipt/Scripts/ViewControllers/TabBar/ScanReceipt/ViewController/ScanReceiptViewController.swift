//
//  ScanReceiptViewController.swift
//  SmartReceipt
//
//  Created by Daiki Kobayashi on 2024/10/17.
//

import UIKit
import AVFoundation

final class ScanReceiptViewController: UIViewController {
    @IBOutlet private weak var scanCameraView: ScanCameraView!
    @IBOutlet private weak var shootButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        shootButton.setTitle(nil, for: .normal)
        shootButton.backgroundColor = .green
        shootButton.addTarget(self, action: #selector(didTapShutter(_:)), for: .touchUpInside)
    }
    
    // MARK: - イベント
    
    @objc private func didTapShutter(_ button: UIButton) {
        scanCameraView.shoot()
    }
}
