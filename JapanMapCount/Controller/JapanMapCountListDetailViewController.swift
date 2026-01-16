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
    @IBAction func newRegistrationButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "JapanMapCountNewRegistration", bundle: nil)
        guard let navigationViewContloeer = storyboard.instantiateInitialViewController(creator: { coder in
            return UINavigationController(coder: coder)
        }) else { return}
        navigationViewContloeer.modalPresentationStyle = .fullScreen
        present(navigationViewContloeer, animated: true)
    }
    private let prefecture: Prefecture
    private var recordModel: [RecordModel] = []
    
    init?(coder: NSCoder, prefecture: Prefecture) {
        self.prefecture = prefecture
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("int(coder:) has not been errSecUnimplemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // タイトルに県名表示
        title = prefecture.displayName
        configureSortOrderButton()
        
        setTableView()
        // デモデータ
        setupDemoRecord()
        // 更新
        listDetailView.reloadData()
        
    }
    
    private func setupDemoRecord() {
        let date = Date()
        let calendar = Calendar.current
        
        recordModel = [
            RecordModel(recordDate: date, recordText: "テスト１"),
            RecordModel(recordDate: calendar.date(byAdding: .day, value: -11, to: date)!, recordText: "テスト2。改行確認"),
            RecordModel(recordDate: calendar.date(byAdding: .day, value: -22, to: date)!, recordText: "テスト3です。改行確認、改行されていますか？")
        ]
    }
 
    private func setTableView() {
        let nib = UINib(nibName: "RecordListCell", bundle: nil)
        listDetailView.register(nib, forCellReuseIdentifier: "RecordListCell")
        listDetailView.dataSource = self
        listDetailView.delegate = self
    }
    
    private func configureSortOrderButton() {
        // アイコン
        sortOrderButton.setImage(UIImage(systemName: "arrow.up.arrow.down"), for: .normal)
        // 色
        sortOrderButton.backgroundColor = .systemBlue
        sortOrderButton.tintColor = .white
        // 見た目
        sortOrderButton.clipsToBounds = true
        sortOrderButton.layer.cornerRadius = sortOrderButton.frame.width / 2

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
