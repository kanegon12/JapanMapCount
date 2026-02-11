//
//  CountLabelModel.swift
//  JapanMapCount
//
//  Created by Newbie on 2026/02/06.
//

import UIKit

/// 都道府県ごとのカウントラベルを管理する構造体
struct CountLabelModel {
    /// 都道府県ごとのラベル辞書
    private(set) var prefectureStackViews: [Prefecture: PrefectureCountStackView] = [:]
    
    private let unifiedSize = CGSize(width: 30, height: 25)
    
    mutating func updateView(for prefecture: Prefecture, prefectureName: String, count: Int, path: UIBezierPath, in containerView: UIView) {
        // 既存があれば再利用、なければXIBから生成して追加
        let stackView: PrefectureCountStackView = {
            if let existing = prefectureStackViews[prefecture] { return existing }
            let newStackView = PrefectureCountStackView.makeFromNib()
            newStackView.translatesAutoresizingMaskIntoConstraints = true
            containerView.addSubview(newStackView)
            prefectureStackViews[prefecture] = newStackView
            return newStackView
        }()
        // 表示内容更新
        stackView.updateLabel(prefectureName: prefectureName, count: count)
        // サイズ
        stackView.bounds = CGRect(origin: .zero, size: unifiedSize)
        // 県の中心に配置
        stackView.center = pointInsidePath(path)
    }
    
    /// パス内の適切な位置を計算する
    private func pointInsidePath(_ path: UIBezierPath) -> CGPoint {
        // 境界
        let bounds = path.bounds
        // boundsの中心を算出
        let center = CGPoint(x: bounds.midX, y: bounds.midY)
        // boundsの中心がpath内かチェック
        if path.contains(center) { return center }
        // 中心が外にある場合
        // 探索の間隔指定
        let interval: CGFloat = max(2, min(bounds.width, bounds.height) / 10)
        // 探索の限界値
        let maxRadius: CGFloat = max(bounds.width, bounds.height) / 2
        
        var radius: CGFloat = interval
        while radius <= maxRadius {
            for directionIndex in 0..<16 {
                let angle = (CGFloat(directionIndex) / 16.0) * (.pi * 2)
                let point = CGPoint(x: center.x + cos(angle) * radius, y: center.y + sin(angle) * radius)
                if path.contains(point) { return point }
            }
            radius += interval
        }
        
        return center
    }
}
