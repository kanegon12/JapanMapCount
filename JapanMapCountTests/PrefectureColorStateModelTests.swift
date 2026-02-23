//
//  PrefectureColorStateModelTests.swift
//  JapanMapCountTests
//
//  Created by Newbie on 2026/02/20.
//
// 正常系：upCount/downCount の通常の増減
// 境界値・異常系：downCountで0のときそれ以下にならないこと
//

import XCTest
import Foundation
import RealmSwift
@testable import JapanMapCount

final class PrefectureColorStateModelTests: XCTestCase {
    
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
    
    func testInitialization() {
        // Given（前提条件：テストの準備・入力データ） & When（前提条件と実行：準備とメソッド呼び出し）
        let model = PrefectureColorStateModel(prefectureNumber: 13)
        
        // Then（検証：期待する結果を確認する）
        XCTAssertEqual(model.prefectureNumber, 13)
        XCTAssertEqual(model.recordCount, 0)
    }
    
    func testInitialization_WithDifferentPrefecture() {
        // Given（前提条件：テストの準備・入力データ） & When（前提条件と実行：準備とメソッド呼び出し）
        let model = PrefectureColorStateModel(prefectureNumber: 1)
        
        // Then（検証：期待する結果を確認する）
        XCTAssertEqual(model.prefectureNumber, 1)
        XCTAssertEqual(model.recordCount, 0)
    }
    
    // MARK: - upCount Tests
    
    func testUpCount_IncrementsFromZero() {
        // Given（前提条件：テストの準備・入力データ）
        let model = PrefectureColorStateModel(prefectureNumber: 13)
        try! realm.write {
            realm.add(model)
        }
        
        // When（実行：テスト対象のメソッドを呼び出す）
        try! realm.write {
            model.upCount()
        }
        
        // Then（検証：期待する結果を確認する）
        XCTAssertEqual(model.recordCount, 1)
    }
    
    func testUpCount_MultipleIncrements() {
        // Given（前提条件：テストの準備・入力データ）
        let model = PrefectureColorStateModel(prefectureNumber: 13)
        try! realm.write {
            realm.add(model)
        }
        
        // When（実行：テスト対象のメソッドを呼び出す）
        try! realm.write {
            model.upCount()
            model.upCount()
            model.upCount()
        }
        
        // Then（検証：期待する結果を確認する）
        XCTAssertEqual(model.recordCount, 3)
    }
    
    func testUpCount_AfterSettingCount() {
        // Given（前提条件：テストの準備・入力データ）
        let model = PrefectureColorStateModel(prefectureNumber: 13)
        try! realm.write {
            realm.add(model)
            // recordCountはprivate(set)なので、直接設定できない
            // 代わりにupCountを複数回呼び出す
            for _ in 0..<5 {
                model.upCount()
            }
        }
        
        // When（実行：テスト対象のメソッドを呼び出す）
        try! realm.write {
            model.upCount()
        }
        
        // Then（検証：期待する結果を確認する）
        XCTAssertEqual(model.recordCount, 6)
    }
    
    // MARK: - downCount Tests
    
    func testDownCount_FromZero_StaysAtZero() {
        // Given（前提条件：テストの準備・入力データ）
        let model = PrefectureColorStateModel(prefectureNumber: 13)
        try! realm.write {
            realm.add(model)
        }
        
        // When（実行：テスト対象のメソッドを呼び出す）
        try! realm.write {
            model.downCount()
        }
        
        // Then（検証：期待する結果を確認する）
        XCTAssertEqual(model.recordCount, 0)
    }
    
    func testDownCount_FromPositive_Decrements() {
        // Given（前提条件：テストの準備・入力データ）
        let model = PrefectureColorStateModel(prefectureNumber: 13)
        try! realm.write {
            realm.add(model)
            for _ in 0..<5 {
                model.upCount()
            }
        }
        
        // When（実行：テスト対象のメソッドを呼び出す）
        try! realm.write {
            model.downCount()
        }
        
        // Then（検証：期待する結果を確認する）
        XCTAssertEqual(model.recordCount, 4)
    }
    
    func testDownCount_MultipleDecrements() {
        // Given（前提条件：テストの準備・入力データ）
        let model = PrefectureColorStateModel(prefectureNumber: 13)
        try! realm.write {
            realm.add(model)
            for _ in 0..<5 {
                model.upCount()
            }
        }
        
        // When（実行：テスト対象のメソッドを呼び出す）
        try! realm.write {
            model.downCount()
            model.downCount()
            model.downCount()
        }
        
        // Then（検証：期待する結果を確認する）
        XCTAssertEqual(model.recordCount, 2)
    }
    
    func testDownCount_BelowZero_StaysAtZero() {
        // Given（前提条件：テストの準備・入力データ）
        let model = PrefectureColorStateModel(prefectureNumber: 13)
        try! realm.write {
            realm.add(model)
            model.upCount()
        }
        
        // When（実行：テスト対象のメソッドを呼び出す）
        try! realm.write {
            model.downCount()
            model.downCount()
            model.downCount()
        }
        
        // Then（検証：期待する結果を確認する）
        XCTAssertEqual(model.recordCount, 0)
    }
    
    // MARK: - Combined Operations Tests
    
    func testUpAndDownCount_Combined() {
        // Given（前提条件：テストの準備・入力データ）
        let model = PrefectureColorStateModel(prefectureNumber: 13)
        try! realm.write {
            realm.add(model)
        }
        
        // When（実行：テスト対象のメソッドを呼び出す）
        try! realm.write {
            model.upCount()
            model.upCount()
            model.downCount()
            model.upCount()
            model.downCount()
        }
        
        // Then（検証：期待する結果を確認する）
        XCTAssertEqual(model.recordCount, 1)
    }
}
