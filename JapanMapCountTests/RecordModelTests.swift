//
//  RecordModelTests.swift
//  JapanMapCountTests
//
//  Created by Newbie on 2026/02/20.
//
// 正常系：初期化・更新・Realm保存
// 異常系：updatePrefectureNumber(999) など範囲外の番号（現仕様では保存される）
//

import XCTest
import Foundation
import RealmSwift
@testable import JapanMapCount

final class RecordModelTests: XCTestCase {
    
    var realm: Realm!
    
    override func setUp() {
        super.setUp()
        // テスト用のインメモリRealmを作成（各テストで一意の識別子を使用）
        let identifier = UUID().uuidString
        let config = Realm.Configuration(inMemoryIdentifier: identifier)
        realm = try! Realm(configuration: config)
    }
    
    override func tearDown() {
        if let realm = realm {
            try! realm.write {
                realm.deleteAll()
            }
        }
        realm = nil
        super.tearDown()
    }
    
    // MARK: - Initialization Tests
    
    func testInitialization_WithConvenienceInitializer() {
        // Given（前提条件：テストの準備・入力データ）
        let date = Date()
        let text = "テスト記録"
        
        // When（実行：テスト対象のメソッドを呼び出す）
        let record = RecordModel(prefecture: .tokyo, recordDate: date, recordText: text)
        
        // Then（検証：期待する結果を確認する）
        XCTAssertEqual(record.prefectureNumber, Prefecture.tokyo.rawValue)
        XCTAssertEqual(record.recordDate, date)
        XCTAssertEqual(record.recordText, text)
    }
    
    func testInitialization_WithDifferentPrefecture() {
        // Given（前提条件：テストの準備・入力データ）
        let date = Date()
        let text = "大阪の記録"
        
        // When（実行：テスト対象のメソッドを呼び出す）
        let record = RecordModel(prefecture: .osaka, recordDate: date, recordText: text)
        
        // Then（検証：期待する結果を確認する）
        XCTAssertEqual(record.prefectureNumber, Prefecture.osaka.rawValue)
        XCTAssertEqual(record.recordDate, date)
        XCTAssertEqual(record.recordText, text)
    }
    
    func testInitialization_HasUniqueId() {
        // Given（前提条件：テストの準備・入力データ） & When（前提条件と実行：準備とメソッド呼び出し）
        let record1 = RecordModel(prefecture: .tokyo, recordDate: Date(), recordText: "記録1")
        let record2 = RecordModel(prefecture: .osaka, recordDate: Date(), recordText: "記録2")
        
        // Then（検証：期待する結果を確認する）
        XCTAssertNotEqual(record1.id, record2.id)
    }
    
    // MARK: - updateRecord Tests
    
    func testUpdateRecord_UpdatesDateAndText() {
        // Given（前提条件：テストの準備・入力データ）
        let originalDate = Date()
        let originalText = "元のテキスト"
        let record = RecordModel(prefecture: .tokyo, recordDate: originalDate, recordText: originalText)
        try! realm.write {
            realm.add(record)
        }
        
        let newDate = Date().addingTimeInterval(3600)
        let newText = "新しいテキスト"
        
        // When（実行：テスト対象のメソッドを呼び出す）
        try! realm.write {
            record.updateRecord(recordDate: newDate, recordText: newText)
        }
        
        // Then（検証：期待する結果を確認する）
        XCTAssertEqual(record.recordDate, newDate)
        XCTAssertEqual(record.recordText, newText)
    }
    
    func testUpdateRecord_PreservesPrefectureNumber() {
        // Given（前提条件：テストの準備・入力データ）
        let record = RecordModel(prefecture: .tokyo, recordDate: Date(), recordText: "テスト")
        let originalPrefectureNumber = record.prefectureNumber
        try! realm.write {
            realm.add(record)
        }
        
        // When（実行：テスト対象のメソッドを呼び出す）
        try! realm.write {
            record.updateRecord(recordDate: Date(), recordText: "更新されたテキスト")
        }
        
        // Then（検証：期待する結果を確認する）
        XCTAssertEqual(record.prefectureNumber, originalPrefectureNumber)
    }
    
    // MARK: - updatePrefectureNumber Tests
    
    func testUpdatePrefectureNumber_UpdatesPrefectureNumber() {
        // Given（前提条件：テストの準備・入力データ）
        let record = RecordModel(prefecture: .tokyo, recordDate: Date(), recordText: "テスト")
        try! realm.write {
            realm.add(record)
        }
        
        // When（実行：テスト対象のメソッドを呼び出す）
        try! realm.write {
            record.updatePrefectureNumber(prefectureNumber: Prefecture.osaka.rawValue)
        }
        
        // Then（検証：期待する結果を確認する）
        XCTAssertEqual(record.prefectureNumber, Prefecture.osaka.rawValue)
    }
    
    func testUpdatePrefectureNumber_PreservesDateAndText() {
        // Given（前提条件：テストの準備・入力データ）
        let originalDate = Date()
        let originalText = "テストテキスト"
        let record = RecordModel(prefecture: .tokyo, recordDate: originalDate, recordText: originalText)
        try! realm.write {
            realm.add(record)
        }
        
        // When（実行：テスト対象のメソッドを呼び出す）
        try! realm.write {
            record.updatePrefectureNumber(prefectureNumber: Prefecture.osaka.rawValue)
        }
        
        // Then（検証：期待する結果を確認する）
        XCTAssertEqual(record.recordDate, originalDate)
        XCTAssertEqual(record.recordText, originalText)
    }
    
    func testUpdatePrefectureNumber_WithInvalidNumber() {
        // Given（前提条件：テストの準備・入力データ）
        let record = RecordModel(prefecture: .tokyo, recordDate: Date(), recordText: "テスト")
        try! realm.write {
            realm.add(record)
        }
        
        // When（実行：テスト対象のメソッドを呼び出す）
        try! realm.write {
            record.updatePrefectureNumber(prefectureNumber: 999)
        }
        
        // Then（検証：期待する結果を確認する）
        XCTAssertEqual(record.prefectureNumber, 999)
    }
    
    // MARK: - Realm Integration Tests
    
    func testRecordModel_CanBeSavedToRealm() {
        // Given（前提条件：テストの準備・入力データ）
        let record = RecordModel(prefecture: .tokyo, recordDate: Date(), recordText: "テスト記録")
        
        // When（実行：テスト対象のメソッドを呼び出す）
        try! realm.write {
            realm.add(record)
        }
        
        // Then（検証：期待する結果を確認する）
        let savedRecords = realm.objects(RecordModel.self)
        XCTAssertEqual(savedRecords.count, 1)
        XCTAssertEqual(savedRecords.first?.prefectureNumber, Prefecture.tokyo.rawValue)
    }
    
    func testRecordModel_MultipleRecords() {
        // Given（前提条件：テストの準備・入力データ）
        let record1 = RecordModel(prefecture: .tokyo, recordDate: Date(), recordText: "記録1")
        let record2 = RecordModel(prefecture: .osaka, recordDate: Date(), recordText: "記録2")
        
        // When（実行：テスト対象のメソッドを呼び出す）
        try! realm.write {
            realm.add(record1)
            realm.add(record2)
        }
        
        // Then（検証：期待する結果を確認する）
        let savedRecords = realm.objects(RecordModel.self)
        XCTAssertEqual(savedRecords.count, 2)
    }
    
    func testRecordModel_UpdateInRealm() {
        // Given（前提条件：テストの準備・入力データ）
        let record = RecordModel(prefecture: .tokyo, recordDate: Date(), recordText: "元のテキスト")
        try! realm.write {
            realm.add(record)
        }
        
        let newDate = Date().addingTimeInterval(3600)
        let newText = "更新されたテキスト"
        
        // When（実行：テスト対象のメソッドを呼び出す）
        try! realm.write {
            record.updateRecord(recordDate: newDate, recordText: newText)
        }
        
        // Then（検証：期待する結果を確認する）
        let savedRecord = realm.objects(RecordModel.self).first!
        XCTAssertEqual(savedRecord.recordDate, newDate)
        XCTAssertEqual(savedRecord.recordText, newText)
    }
}
