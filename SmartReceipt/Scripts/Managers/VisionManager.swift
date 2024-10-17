//
//  VisionManager.swift
//  SmartReceipt
//
//  Created by Daiki Kobayashi on 2024/10/18.
//

import Vision
import UIKit

final class VisionManager {
    /// 画像からテキスト検出
    static func read(image: UIImage?) {
        guard let cgImage = image?.cgImage else { return }
        let requestHandler = VNImageRequestHandler(cgImage: cgImage)
        // テキスト分析のリクエスト作成
        let request = VNRecognizeTextRequest(completionHandler: recognizeTextHandler)
        // 検出文字を日本語として優先に認識するよう設定
        request.recognitionLanguages = ["ja-JP"]
        
        do {
            // 画像からテキスト検出開始
            try requestHandler.perform([request])
        } catch {
            print(error)
        }
    }
    
    /// 検出結果の処理
    private static func recognizeTextHandler(request: VNRequest, error: Error?) {
        // 検出された結果配列
        guard let observations =
                request.results as? [VNRecognizedTextObservation] else {
            return
        }
        
        let recognizedStrings = observations.compactMap { observation in
            // topCandidates(1) は認識されたテキスト文字列の1つだけ取り出す。
            // 1つだけと指定しても配列型で返されるため firstが必要
            return observation.topCandidates(1).first?.string
        }
        
        print(recognizedStrings)
    }
}
