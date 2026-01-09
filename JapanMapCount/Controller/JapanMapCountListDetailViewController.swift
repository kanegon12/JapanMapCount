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
    
    private var recordModel: [RecordModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // タイトルに県名表示
        title = prefecture?.displayName
        
        // デモデータ
        let demoData1 = RecordModel()
        demoData1.recordDate = Date()
        demoData1.recordText = "これはテスト1です。"
        let demoData2 = RecordModel()
        demoData2.recordDate = Date()
        demoData2.recordText = "これはテスト2です。改行確認です。"
        let demoData3 = RecordModel()
        demoData3.recordDate = Date()
        demoData3.recordText = "これはテスト3です。改行確認です。"
        self.recordModel = [demoData1, demoData2, demoData3]
        
        
        setTableView()
    }
 
    private func setTableView() {
        let nib = UINib(nibName: "RecordListCell", bundle: nil)
        listDetailView.register(nib, forCellReuseIdentifier: "RecordListCell")
        listDetailView.dataSource = self
        listDetailView.delegate = self
    }
    
}

extension JapanMapCountListDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recordModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecordListCell", for: indexPath) as! RecordListCell
        cell.configure(recordModel: recordModel[indexPath.row])
        return cell
    }
    
    
}

extension JapanMapCountListDetailViewController: UITableViewDelegate {
    
}
