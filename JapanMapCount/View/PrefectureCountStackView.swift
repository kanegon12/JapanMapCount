//
//  PrefectureCountStackView.swift
//  JapanMapCount
//
//  Created by Newbie on 2026/02/11.
//

import UIKit

final class PrefectureCountStackView: UIStackView {
    
    @IBOutlet weak var prefectureNameLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // 数字だけ小さくする
        countLabel.font = UIFont.monospacedDigitSystemFont(ofSize: 11, weight: .bold)
    }
    
    static func makeFromNib() -> PrefectureCountStackView {
        let nib = UINib(nibName: "PrefectureCountStackView", bundle: nil)
        guard let stackView = nib.instantiate(withOwner: nil, options: nil).first as? PrefectureCountStackView else {
            fatalError("makeFromNibの処理でエラーが発生しました")
        }
        // 地図のタップを邪魔しない
        stackView.isUserInteractionEnabled = false
        return stackView
    }
    
    /// 表示の更新(県名とcount)
    func updateLabel(prefectureName: String, count: Int) {
        prefectureNameLabel.text = prefectureName
        countLabel.text = formatCount(count)
    }
    
    /// カウントの表示を100以上は"99+"として表示
    internal func formatCount(_ count: Int) -> String {
        if count >= 100 { return "99+" }
        return "\(count)"
    }
}
