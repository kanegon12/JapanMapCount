//
//  JapanMapCountListDetailViewController.swift
//  JapanMapCount
//
//  Created by Newbie on 2026/01/07.
//

import UIKit

final class JapanMapCountListDetailViewController: UIViewController {
    @IBOutlet weak var listDetailView: UITableView!
    
    var prefecture: Prefecture?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = prefecture?.displayName
        
    }
    
}
