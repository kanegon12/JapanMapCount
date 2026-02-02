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

final class JapanMapView: UIView {
    
    weak var delegate: JapanMapViewDelegate?
    private var visitedPrefectureNumber: Set<Int> = []
    
    private var prefecturePaths: [Prefecture: CGPath] = [:]
    
    private var prefectureCounts: [Int: Int] = [:]
    private var countLabels: [Prefecture: UILabel] = [:]
    
    /// 都道府県シェイプ用のコンテナ（self.layer を触らないためクラッシュを防ぐ）
    private let mapContentView: UIView = {
        let v = UIView()
        v.isUserInteractionEnabled = false
        v.backgroundColor = .clear
        return v
    }()
    
    private var isDrawing = false
    
    
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
        // 地図用コンテナを1つだけ追加（self.layer は使わず、この子ビューの layer のみ操作する）
        addSubview(mapContentView)
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
        // コンテナのフレームをビューに合わせる
        mapContentView.frame = bounds
        let contentLayer = mapContentView.layer
        // 古い都道府県シェイプのみ削除（自前のコンテナなのでコピーしてから削除）
        if let sublayers = contentLayer.sublayers {
            Array(sublayers).forEach { $0.removeFromSuperlayer() }
        }
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
            shapeLayer.fillColor = (isVisited(prefecture) ? prefecture.region.color : UIColor.white).cgColor
            // 輪郭線の色
            shapeLayer.strokeColor = UIColor.black.cgColor
            // 輪郭線の太さ
            shapeLayer.lineWidth = 1.5
            // コンテナレイヤーに追加
            mapContentView.layer.addSublayer(shapeLayer)
            
            // 変換済みパスの保存
            prefecturePaths[prefecture] = path.cgPath
            // 回数ラベル更新
            let countPrefecture = count(for: prefecture)
            updateCountLabel(for: prefecture, path: path, count:countPrefecture)
        }
        
    }
    
    func setVisitedPrefecture(_ set: Set<Int>) {
        visitedPrefectureNumber = set
        setNeedsLayout()
    }
    private func isVisited(_ prefecture: Prefecture) -> Bool {
        visitedPrefectureNumber.contains(prefecture.rawValue)
    }
    
    func setPrefectureCounts(_ counts: [Int: Int]) {
        prefectureCounts = counts
        setNeedsLayout()
    }
    /// 訪問回数(何もなければ0を返す)
    private func count(for prefecture: Prefecture) -> Int {
        prefectureCounts[prefecture.rawValue] ?? 0
    }
    /// UILabel生成
    private func updateCountLabel(for prefecture: Prefecture, path: UIBezierPath, count: Int) {
        // ラベルを取得しなければ作成
        let label: UILabel = {
            // 既存
            if let existing = countLabels[prefecture] { return existing }
            // 新規
            let newLabel = UILabel()
            // 中央配置
            newLabel.textAlignment = .center
            // 背景不透明度
            newLabel.backgroundColor = UIColor(white: 1.0, alpha: 0.05)
            // 文字の色
            newLabel.textColor = .black
            // 枠からはみ出ない様に
            newLabel.clipsToBounds = true
            // 桁数が増えても円内に収まるようフォントを縮小
            newLabel.adjustsFontSizeToFitWidth = true
            newLabel.minimumScaleFactor = 0.3
            // 表示
            addSubview(newLabel)
            // 辞書に登録
            countLabels[prefecture] = newLabel
            return newLabel
        }()
        
        label.isHidden = false
        label.text = "\(count)"
        
        let size = labelSize(for: path)
        label.frame = CGRect(x: 0, y: 0, width: size, height: size)
        label.layer.cornerRadius = size / 2
        label.font = UIFont.boldSystemFont(ofSize: size * 0.55 * 1.5)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.3
        
        // 都道府県の中心（またはパス内の適切な点）にラベルを配置
        let centerInPath = labelPointInsidePath(path)
        label.center = centerInPath
    }
    
    /// 都道府県ラベルの円サイズ（全県で統一）
    private let unifiedLabelSize: CGFloat = 18

    private func labelSize(for path: UIBezierPath) -> CGFloat {
        unifiedLabelSize
    }
    
    private func labelPointInsidePath(_ path: UIBezierPath) -> CGPoint {
        // 境界
        let bounds = path.bounds
        // boundsの中心を算出
        let center = CGPoint(x: bounds.midX, y: bounds.midY)
        // boundsの中心がpath内かチェック
        if path.contains(center) { return center }
        // 中心が外にある
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
