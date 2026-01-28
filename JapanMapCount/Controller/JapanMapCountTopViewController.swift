//
//  JapanMapCountTopViewController.swift
//  JapanMapCount
//
//  Created by Newbie on 2025/12/27.
//

import UIKit
import RealmSwift

final class JapanMapCountTopViewController: UIViewController {
    
    @IBOutlet weak var mapView: JapanMapView!

    private let realm = try! Realm()
    @IBOutlet weak var assistanceMessage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        countPrefecture()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        countPrefecture()
    }
    
    /// １回以上訪れた県を判別
    private func countPrefecture() {
        let state = realm.objects(PrefectureColorStateModel.self)
        let visitedPrefecture = Set(state.filter{ $0.recordCount >= 1 }.map { $0.prefectureNumber })
        mapView.setVisitedPrefecture(visitedPrefecture)
        
        setAssistanceMessage()
    }
    /// assistanceMessage設定
    private func setAssistanceMessage() {
        assistanceMessage.text = "訪れた県をタップして記録しよう！"
        assistanceMessage.font = UIFont.boldSystemFont(ofSize: 24)
    }
    
}

extension JapanMapCountTopViewController: JapanMapViewDelegate {
    func pushListDetail(_ mapView: JapanMapView, didTap prefecture: Prefecture) {
        let storyboard = UIStoryboard(name: "JapanMapCountListDetail", bundle: nil)
        let detailViewController = storyboard.instantiateViewController(identifier: "JapanMapCountListDetail") { coder in
            return JapanMapCountListDetailViewController(coder: coder, prefecture: prefecture)
        }
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}
