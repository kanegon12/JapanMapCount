//
//  JapanMapCountListDetailViewController.swift
//  JapanMapCount
//
//  Created by Newbie on 2026/01/07.
//

import UIKit

final class JapanMapCountListDetailViewController: UIViewController {
    @IBOutlet weak var listDetailView: UITableView!
    @IBOutlet weak var sortOrderButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // タイトルに県名表示
        title = prefecture?.displayName
        configureSortOrderButton()
        
    }

    private var prefecture: Prefecture?
    
    // prefectureを外部から呼ぶため
    func setPrefecture(prefecture: Prefecture) {
        self.prefecture = prefecture
    }
    
    private func configureSortOrderButton() {
        // アイコン
        sortOrderButton.setTitle(nil, for: .normal)
        sortOrderButton.setImage(UIImage(systemName: "arrow.up.arrow.down"), for: .normal)
        // 色
        sortOrderButton.backgroundColor = .systemBlue
        sortOrderButton.tintColor = .white
        // 見た目
        sortOrderButton.clipsToBounds = true
        sortOrderButton.layer.cornerRadius = sortOrderButton.frame.width / 2

    }
    
    
}
