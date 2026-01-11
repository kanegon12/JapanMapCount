//
//  JapanMapCountListDetailViewController.swift
//  JapanMapCount
//
//  Created by Newbie on 2026/01/07.
//

import UIKit

final class JapanMapCountListDetailViewController: UIViewController {
    @IBOutlet weak var listDetailView: UITableView!
    
    private var prefecture: Prefecture?
    
    // prefectureを外部から呼ぶため
    func setPrefecture(prefecture: Prefecture) {
        self.prefecture = prefecture
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = prefecture?.displayName
        
    }
    
}
