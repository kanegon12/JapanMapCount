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
    private(set) var labels: [Prefecture: UILabel] = [:]
    
    /// 都道府県ラベルの円サイズ（全県で統一）
    private let unifiedLabelSize: CGFloat = 18
    
    init() {}
    
    /// ラベルを取得または作成する
    mutating func getOrCreateLabel(for prefecture: Prefecture, in parentView: UIView) -> UILabel {
        // 既存のラベルがあれば返す
        if let existing = labels[prefecture] {
            return existing
        }
        
        // 新規ラベルを作成
        let newLabel = UILabel()
        newLabel.textAlignment = .center
        newLabel.backgroundColor = UIColor(white: 1.0, alpha: 0.05)
        newLabel.textColor = .assistanceGray
        newLabel.clipsToBounds = true
        newLabel.adjustsFontSizeToFitWidth = true
        newLabel.minimumScaleFactor = 0.3
        
        // 親ビューに追加
        parentView.addSubview(newLabel)
        
        // 辞書に登録
        labels[prefecture] = newLabel
        
        return newLabel
    }
    
    /// ラベルを更新する
    mutating func updateLabel(for prefecture: Prefecture, count: Int, path: UIBezierPath, in parentView: UIView) {
        let label = getOrCreateLabel(for: prefecture, in: parentView)
        
        label.isHidden = count == 0
        label.text = "\(count)"
        
        let size = unifiedLabelSize
        label.frame = CGRect(x: 0, y: 0, width: size, height: size)
        
        label.layer.cornerRadius = size / 2
        // 背景不透明度
        label.font = UIFont.boldSystemFont(ofSize: size * 0.55 * 1.5)
        // 桁数が増えても円内に収まるようフォントを縮小
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.3
        
        // 都道府県の中心（またはパス内の適切な点）にラベルを配置
        let centerInPath = calculateLabelPointInsidePath(path)
        label.center = centerInPath
    }
    
    /// パス内の適切な位置を計算する
    private func calculateLabelPointInsidePath(_ path: UIBezierPath) -> CGPoint {
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
