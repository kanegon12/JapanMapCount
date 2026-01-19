//
//  JapanMapView.swift
//  JapanMapCount
//
//  Created by Newbie on 2025/12/27.
//

import UIKit

protocol JapanMapViewDelegate: AnyObject {
    func pushListDetail(_ mapView: JapanMapView, didTap prefecture: Prefecture)
}

@IBDesignable final class JapanMapView: UIView {
    
    weak var delegate: JapanMapViewDelegate?
    
    private var prefecturePaths: [Prefecture: CGPath] = [:]
    
    /// コード生成初期化
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    /// Storyboard生成初期化
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        // タップを受けられる様に
        isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        addGestureRecognizer(tap)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        drawMap()
    }
    
    @objc private func handleTap(_ gesture: UITapGestureRecognizer) {
        // タップされた座標
        let point = gesture.location(in: self)
        // 座標が都道府県の中か判定
        for prefecture in Prefecture.allCases {
            guard let cgPath = prefecturePaths[prefecture] else { continue }
            // Pathの中にpointの座標が入っているか
            if cgPath.contains(point, using: .winding, transform: .identity) {
                print("\(prefecture)がタップされました")
                
                // タップを通知
                delegate?.pushListDetail(self, didTap: prefecture)
                return
            }
            
        }
        print("県外をタップしています")
    }
    
    /// 地図全体の外枠を求める
    private func originalMapBounds() -> CGRect {
        var rect = CGRect.null
        for prefecture in Prefecture.allCases {
            let path = JapanMapPaths.path(for: prefecture)
            rect = rect.union(path.bounds)
        }
        return rect
    }
    
    /// 地図を描画
    private func drawMap() {
        // 数値が0なら描画しない
        guard bounds.width > 0, bounds.height > 0 else { return }
        // 一度古い都道府県の形を全部消す
        layer.sublayers?.forEach { $0.removeFromSuperlayer() }
        // 地図全体の外枠を求める
        let original = originalMapBounds()
        // 上下左右に余白を設定
        let inset: CGFloat = 16
        let targetRect = bounds.insetBy(dx: inset, dy: inset)
        // はみ出さない様に縮尺計算
        let scale = min(targetRect.width / original.width,
                        targetRect.height / original.height)
        // (0,0)を左上に設定
        let setToZero = CGAffineTransform(
            translationX: -original.origin.x,
            y: -original.origin.y
        )
        // 縮尺適用
        let scaleTransform = CGAffineTransform(scaleX: scale, y: scale)
        // 変換
        let baseTransform = setToZero.concatenating(scaleTransform)
        // baseの外枠を計算
        let scaledBounds = original.applying(baseTransform)
        // 中央配置
        let centerTransform = CGAffineTransform(
            translationX: targetRect.midX - scaledBounds.midX,
            y: targetRect.midY - scaledBounds.midY
        )
        // 最終変換
        let finalTransform = baseTransform.concatenating(centerTransform)
        // 全都道府県描画
        for prefecture in Prefecture.allCases {
            // copy() で複製してから縮尺
            guard let path = JapanMapPaths.path(for: prefecture).copy() as? UIBezierPath else { continue }
            // 最終変換を適用
            path.apply(finalTransform)
            // イニシャライザ
            let shapeLayer = CAShapeLayer()
            // CGPathに変換
            shapeLayer.path = path.cgPath
            // 中身の色
            shapeLayer.fillColor = UIColor.white.cgColor
            // 輪郭線の色
            shapeLayer.strokeColor = UIColor.black.cgColor
            // 輪郭線の太さ
            shapeLayer.lineWidth = 1.5
            // レイヤーに貼る
            layer.addSublayer(shapeLayer)
            
            // 変換済みパスの保存
            prefecturePaths[prefecture] = path.cgPath
        }
        
    }
    
}
