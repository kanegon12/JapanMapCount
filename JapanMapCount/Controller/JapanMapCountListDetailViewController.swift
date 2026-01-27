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
    @IBOutlet weak var newRegistrationButton: UIBarButtonItem!
    @IBOutlet weak var sortOrderButton: UIButton!
    @IBAction func didTapNewRegistrationButton(_ sender: Any) {
        newRegistration(editing: nil)
    }
    
    @IBAction func didTapSortButton(_ sender: Any) {
        isAscending.toggle()
        fetchRecords()
        listDetailView.reloadData()
    }
    
    private let prefecture: Prefecture
    private let realm = try! Realm()
    private var records: Results<RecordModel>!
    private var isAscending = false
    
    
    
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
        configureNewRegistrationButton()
        configureSortOrderButton()
        setTableView()
        fetchRecords()
        // 更新
        listDetailView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        listDetailView.reloadData()
    }
    
    
    
    private func setTableView() {
        let nib = UINib(nibName: "RecordListCell", bundle: nil)
        listDetailView.register(nib, forCellReuseIdentifier: "RecordListCell")
        listDetailView.dataSource = self
        listDetailView.delegate = self
        
    }
    /// 並び順
    private func fetchRecords() {
        records = realm.objects(RecordModel.self)
            .where { $0.prefectureNumber == prefecture.rawValue }
            .sorted(byKeyPath: "recordDate", ascending: isAscending)
    }
    
    private func configureNewRegistrationButton() {
        newRegistrationButton.tintColor = .systemBlue
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
    /// JapanMapCountNewRegistrationViewControllerへ画面遷移
    private func newRegistration(editing recordId: ObjectId?) {
        let storyboard = UIStoryboard(name: "JapanMapCountNewRegistration", bundle: nil)
        let newRegistrationViewController = storyboard.instantiateViewController(
            identifier: "JapanMapCountNewRegistration"
        ) { coder in
            JapanMapCountNewRegistrationViewController(
                coder: coder,
                delegate: self,
                prefecture: self.prefecture,
                editingRecordId: recordId
            )
        }
        let navigationViewController = UINavigationController(rootViewController: newRegistrationViewController)
        navigationViewController.modalPresentationStyle = .fullScreen
        present(navigationViewController, animated: true)
    }
    
    private func updateColorState(prefectureNumber: Int, isFluctuation: Bool) {
        let state = realm.object(ofType: PrefectureColorStateModel.self,forPrimaryKey: prefectureNumber) ?? PrefectureColorStateModel(prefectureNumber: prefectureNumber)
        // stateを新規で作ったらrealmにaddする
        if state.realm == nil {
            realm.add(state)
        }
        if isFluctuation {
            state.upCount()
        } else {
            state.downCount()
        }
        
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
    /// cellスワイプで削除
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else { return }
        let record = records[indexPath.row]
        try! realm.write {
            realm.delete(record)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            // recordCountを-1
            updateColorState(prefectureNumber: prefecture.rawValue, isFluctuation: false)
            
        }
    }
}

extension JapanMapCountListDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let record = records[indexPath.row]
        newRegistration(editing: record.id)
    }
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "削除"
    }
}

extension JapanMapCountListDetailViewController: JapanMapCountNewRegistrationViewControllerDelegate {
    func tapToSaveButton(date: Date, text: String, prefecture: Prefecture, editingId: ObjectId?) {
        try! realm.write {
            if let id = editingId,
               let record = realm.object(ofType: RecordModel.self, forPrimaryKey: id) {
                // 編集
                record.updateRecord(recordDate: date, recordText: text)
            } else {
                // 新規
                let newRecord = RecordModel()
                newRecord.updatePrefectureNumber(prefectureNumber: prefecture.rawValue)
                newRecord.updateRecord(recordDate: date, recordText: text)
                
                realm.add(newRecord)
                // recordCountを+1
                updateColorState(prefectureNumber: prefecture.rawValue, isFluctuation: true)
            }
        }
    }
    
}
