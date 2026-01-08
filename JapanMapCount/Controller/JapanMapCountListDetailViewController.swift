//
//  JapanMapCountListDetailViewController.swift
//  JapanMapCount
//
//  Created by Newbie on 2026/01/07.
//

import UIKit

final class JapanMapCountListDetailViewController: UIViewController {
    @IBOutlet weak var listDetailView: UITableView!
    @IBAction func sortOrderButton(_ sender: Any) {
    }
    
    var prefecture: Prefecture?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // タイトルに県名表示
        title = prefecture?.displayName
        
    }
    
}
