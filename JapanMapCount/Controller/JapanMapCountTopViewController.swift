//
//  JapanMapCountTopViewController.swift
//  JapanMapCount
//
//  Created by Newbie on 2025/12/27.
//

import UIKit
import RealmSwift
// Google AdMob SDKを使うために必要
import GoogleMobileAds

final class JapanMapCountTopViewController: UIViewController {

    @IBOutlet weak var mapView: JapanMapView!
    @IBOutlet weak var assistanceMessage: UILabel!
    // Storyboardで配置した下部バナー用のコンテナ（UIView）
    @IBOutlet weak var bottomBannerView: UIView!

    private let realm = try! Realm()
    private var prefectureCountModel = PrefectureCountModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        countPrefecture()
        setMapView()
        setBackgroundColoring()
        setupBannerAd()
    }

    /// バナー広告を設定する
    /// 上部：ナビゲーションバーのタイトル部分に表示
    /// 下部：Storyboardのコンテナに埋め込む
    private func setupBannerAd() {
        navigationItem.titleView = BannerView.make(rootViewController: self)
        bottomBannerView.embedBannerAd(rootViewController: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        countPrefecture()
    }

    /// １回以上訪れた県を判別
    private func countPrefecture() {
        let state = realm.objects(PrefectureColorStateModel.self)
        
        // PrefectureCountModel に集約
        prefectureCountModel = PrefectureCountModel(results: state)
        let visitedPrefecture = prefectureCountModel.visitedPrefectureNumbers
        // 着色
        mapView.setVisitedPrefecture(visitedPrefecture)
        // カウント表示
        mapView.setPrefectureCounts(prefectureCountModel.counts)
        
        setAssistanceMessage()
    }
    /// assistanceMessage設定
    private func setAssistanceMessage() {
        assistanceMessage.text = "訪れた県をタップして記録しよう！"
        assistanceMessage.font = UIFont.boldSystemFont(ofSize: 24)
        assistanceMessage.textColor = .assistanceGray
    }
    
    private func setMapView() {
        mapView.backgroundColor = .mapViewBackgroundBlue
    }
    /// セーフエリア外も着色
    private func setBackgroundColoring() {
        view.backgroundColor = .mapViewBackgroundBlue
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
