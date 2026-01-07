//
//  JapanMapCountTopViewController.swift
//  JapanMapCount
//
//  Created by Newbie on 2025/12/27.
//

import UIKit

final class JapanMapCountTopViewController: UIViewController {
    
    @IBOutlet weak var mapView: JapanMapView!
    
    private var selectedPrefecture: Prefecture?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
    }
    
    /// 画面遷移が起こる前に自動的に呼ばれるメソッド
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // identifierのIDが"ShowPrefectureDetail"か確認
        if segue.identifier == "ShowPrefectureDetail",
           let detailViewController = segue.destination as? JapanMapCountListDetailViewController {
            // 選ばれた都道府県のデータを遷移先に渡す
            detailViewController.prefecture = selectedPrefecture
        }
    }
}

extension JapanMapCountTopViewController: JapanmapViewDelegate {
    func japanMapView(_ mapView: JapanMapView, didTap prefecture: Prefecture) {
        // 画面遷移
        selectedPrefecture = prefecture
        performSegue(withIdentifier: "ShowPrefectureDetail", sender: self)
    }
}
