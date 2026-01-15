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
    func pushListDetail(_ mapView: JapanMapView, didTap prefecture: Prefecture) {
        let storyboard = UIStoryboard(name: "JapanMapCountListDetail", bundle: nil)
        let detailViewController = storyboard.instantiateViewController(identifier: "JapanMapCountListDetail") { coder in
            return JapanMapCountListDetailViewController(coder: coder, prefecture: prefecture)
        }
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}
