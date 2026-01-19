//
//  JapanMapCountNewRegistrationViewController.swift
//  JapanMapCount
//
//  Created by Newbie on 2026/01/14.
//
protocol JapanMapCountNewRegistrationViewControllerDelegate: AnyObject {
    func tapToSaveButton(_ ViewController: JapanMapCountNewRegistrationViewController, didSave record: RecordModel)
}

import UIKit
import RealmSwift

final class JapanMapCountNewRegistrationViewController: UIViewController {
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var memoTextField: UITextField!
    @IBAction func didTapCancelButton(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func didTapSaveButton(_ sender: Any) {
        let date = datePicker.date
        // スペースと改行トリミング
        let text = (memoTextField.text ?? "").trimmingCharacters(in: .whitespacesAndNewlines)
        
        let record = RecordModel(prefecture: prefecture, recordDate: date, recordText: text)
        delegate?.tapToSaveButton(self, didSave: record)
        dismiss(animated: true)
    }

    
    let datePicker = UIDatePicker()
    weak var delegate: JapanMapCountNewRegistrationViewControllerDelegate?
    private let prefecture: Prefecture
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCancelButton()
        configureDateTextField()
        configureMemoTextField()
        configureSaveButton()
        setDatePicker()
        
        datePicker.date = Date()
        updataTextField(with: datePicker.date)
        
    }
    init?(coder: NSCoder, delegate: JapanMapCountNewRegistrationViewControllerDelegate, prefecture: Prefecture) {
        self.delegate = delegate
        self.prefecture = prefecture
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// キャンセルボタン設定
    private func configureCancelButton() {
        // 赤色に
        cancelButton.tintColor = .systemRed
    }
    
    /// DateTextField設定
    private func configureDateTextField() {
        dateTextField.borderStyle = .none
        // 枠線を太く
        dateTextField.layer.borderWidth = 1.5
        // 枠の色
        dateTextField.layer.borderColor = UIColor.black.cgColor
        // 角を丸く
        dateTextField.layer.cornerRadius = 8
        dateTextField.clipsToBounds = true
        // 表示文字の大きさと太さ
        dateTextField.font = UIFont.systemFont(ofSize: 25 , weight: .medium)
    }
    
    /// DatePicker設定
    private func setDatePicker() {
        // 日付のみを選択可能に
        datePicker.datePickerMode = .date
        // スクロール式の表示
        datePicker.preferredDatePickerStyle = .wheels
        // 日本語表示に
        datePicker.locale = Locale(identifier: "ja_JP")
        // キーボードの代わりにPickerをだす
        dateTextField.inputView = datePicker
        // ツールバーを作成しサイズ調整
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        // 完了ボタンを作成
        let doneButton = UIBarButtonItem(
            title: "完了",
            style: .done,
            target: self,
            action: #selector(donePressed)
        )
        // 左にスペースを入れて右寄せに
        let flexSpace = UIBarButtonItem(
            barButtonSystemItem: .flexibleSpace,
            target: nil,
            action: nil
        )
        toolbar.setItems([flexSpace, doneButton], animated: true)
        // ツールバー表示
        dateTextField.inputAccessoryView = toolbar
    }
    
    private func updataTextField(with date:Date) {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ja_JP")
        formatter.dateFormat = "yyyy年MM月dd日"
        dateTextField.text = formatter.string(from: date)
    }
    // 完了処理
    @objc func donePressed() {
        updataTextField(with: datePicker.date)
        view.endEditing(true)
    }
    
    /// メモのTextField設定
    private func configureMemoTextField() {
        // 枠線を太くする
        memoTextField.borderStyle = .none
        memoTextField.layer.borderWidth = 1.5
        memoTextField.layer.borderColor = UIColor.black.cgColor
        memoTextField.clipsToBounds = true
        // 文字の大きさ
        memoTextField.font = UIFont.systemFont(ofSize: 25)
        let tools = UIToolbar()
        tools.sizeToFit()
        
        let spacer = UIBarButtonItem(
            barButtonSystemItem: .flexibleSpace,
            target: nil,
            action: nil
        )
        let closeButton = UIBarButtonItem(
            title: "完了",
            style: .done,
            target: self,
            action: #selector(closeTapButton)
        )
        tools.items = [spacer, closeButton]
        memoTextField.inputAccessoryView = tools
    }
    
    @objc func closeTapButton() {
        memoTextField.endEditing(true)
        memoTextField.resignFirstResponder()
    }
    /// 保存ボタン設定
    private func configureSaveButton() {
        saveButton.tintColor = .systemBlue
    }
}
