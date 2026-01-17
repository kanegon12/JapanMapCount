//
//  JapanMapCountListDetailViewController.swift
//  JapanMapCount
//
//  Created by Newbie on 2026/01/07.
//

import UIKit
import RealmSwift

final class JapanMapCountListDetailViewController: UIViewController {
    @IBOutlet weak var listDetailView: UITableView!
    @IBOutlet weak var sortOrderButton: UIButton!
    @IBAction func newRegistrationButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "JapanMapCountNewRegistration", bundle: nil)
        let newRegistrationViewController = storyboard.instantiateViewController(
            identifier: "JapanMapCountNewRegistration"
        ) { coder in
            JapanMapCountNewRegistrationViewController(
                coder: coder,
                delegate: self,
                prefecture: self.prefecture
            )
        }
        let navigationViewController = UINavigationController(rootViewController: newRegistrationViewController)
        navigationViewController.modalPresentationStyle = .fullScreen
        present(navigationViewController, animated: true)
    }
    
    private let prefecture: Prefecture
    private let realm = try! Realm()
    private var records: Results<RecordModel>!
    
    
    
    init?(coder: NSCoder, prefecture: Prefecture) {
        self.prefecture = prefecture
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("int(coder:) has not been errSecUnimplemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        records = realm.objects(RecordModel.self)
            .where { $0.prefectureNumber == prefecture.rawValue }
            .sorted(byKeyPath: "recordDate", ascending: false)
        // タイトルに県名表示
        title = prefecture.displayName
        configureSortOrderButton()
        setTableView()
        // 更新
        listDetailView.reloadData()


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
        return records?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecordListCell", for: indexPath) as! RecordListCell
        guard let records, indexPath.row < records.count else {
            return cell
        }
        cell.configure(recordModel: records[indexPath.row])
        return cell
    }
    
    
}

extension JapanMapCountListDetailViewController: UITableViewDelegate {
    
}

extension JapanMapCountListDetailViewController: JapanMapCountNewRegistrationViewControllerDelegate {
    func tapToSaveButton(_ ViewController: JapanMapCountNewRegistrationViewController, didSave record: RecordModel) {
        try! realm.write {
            realm.add(record)
        }
        listDetailView.reloadData()
    }
}
