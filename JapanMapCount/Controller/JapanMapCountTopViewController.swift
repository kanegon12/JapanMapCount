//
//  JapanMapCountTopViewController.swift
//  JapanMapCount
//
//  Created by Newbie on 2025/12/27.
//

import UIKit

final class JapanMapCountTopViewController: UIViewController {
    
    @IBOutlet weak var mapView: JapanMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
    }
}

extension JapanMapCountTopViewController: JapanMapViewDelegate {
    func japanMapView(_ mapView: JapanMapView, didTap prefecture: Prefecture) {
        // Storyboardを指定して生成
        let storyboard = UIStoryboard(name: "JapanMapCountListDetail", bundle: nil)
        guard let listDetailViewController = storyboard.instantiateViewController(withIdentifier: "JapanMapCountListDetail") as? JapanMapCountListDetailViewController else { return }
        // 値を渡す
        listDetailViewController.setPrefecture(prefecture: prefecture)
        // push遷移
        navigationController?.pushViewController(listDetailViewController, animated: true)
    }
}
