//
//  PrefectureCountModelTests.swift
//  JapanMapCountTests
//
//  Created by Newbie on 2026/02/20.
//
// テストの種類：
// - 正常系：想定どおりの入力で期待する結果が得られること
// - 境界値：0、99、100など境界付近の値での振る舞い
// - 異常系：不正な入力（負の値・範囲外など）でもクラッシュせず、仕様どおり振る舞うこと
//

import XCTest
@testable import JapanMapCount

final class PrefectureCountModelTests: XCTestCase {
    
    var model: PrefectureCountModel!
    
    override func setUp() {
        super.setUp()
        model = PrefectureCountModel()
    }
    
    override func tearDown() {
        model = nil
        super.tearDown()
    }
    
    // MARK: - Initialization Tests
    
    func testInitialization() {
        // Given（前提条件：テストの準備・入力データ） & When（前提条件と実行：準備とメソッド呼び出し）
        let model = PrefectureCountModel()
        
        // Then（検証：期待する結果を確認する）
        XCTAssertEqual(model.visitedCount(for: 1), 0)
        XCTAssertEqual(model.visitedCount(for: 13), 0)
        XCTAssertEqual(model.visitedPrefectureNumbers.count, 0)
    }
    
    // MARK: - visitedCount Tests
    
    func testVisitedCount_WhenNoRecord_ReturnsZero() {
        // Given（前提条件：テストの準備・入力データ） & When（前提条件と実行：準備とメソッド呼び出し）
        let count = model.visitedCount(for: 1)
        
        // Then（検証：期待する結果を確認する）
        XCTAssertEqual(count, 0)
    }
    
    func testVisitedCount_WhenRecordExists_ReturnsCount() {
        // Given（前提条件：テストの準備・入力データ）
        var model = PrefectureCountModel()
        model.setCount(5, for: 13)
        
        // When（実行：テスト対象のメソッドを呼び出す）
        let count = model.visitedCount(for: 13)
        
        // Then（検証：期待する結果を確認する）
        XCTAssertEqual(count, 5)
    }
    
    // MARK: - setCount Tests
    
    func testSetCount_SetsCorrectValue() {
        // Given（前提条件：テストの準備・入力データ）
        var model = PrefectureCountModel()
        
        // When（実行：テスト対象のメソッドを呼び出す）
        model.setCount(10, for: 1)
        
        // Then（検証：期待する結果を確認する）
        XCTAssertEqual(model.visitedCount(for: 1), 10)
    }
    
    func testSetCount_OverwritesExistingValue() {
        // Given（前提条件：テストの準備・入力データ）
        var model = PrefectureCountModel()
        model.setCount(5, for: 13)
        
        // When（実行：テスト対象のメソッドを呼び出す）
        model.setCount(10, for: 13)
        
        // Then（検証：期待する結果を確認する）
        XCTAssertEqual(model.visitedCount(for: 13), 10)
    }
    
    func testSetCount_MultiplePrefectures() {
        // Given（前提条件：テストの準備・入力データ）
        var model = PrefectureCountModel()
        
        // When（実行：テスト対象のメソッドを呼び出す）
        model.setCount(3, for: 1)
        model.setCount(7, for: 13)
        model.setCount(2, for: 27)
        
        // Then（検証：期待する結果を確認する）
        XCTAssertEqual(model.visitedCount(for: 1), 3)
        XCTAssertEqual(model.visitedCount(for: 13), 7)
        XCTAssertEqual(model.visitedCount(for: 27), 2)
    }
    
    // MARK: - updateCount Tests
    
    func testUpdateCount_WhenNoExistingRecord_IncrementsFromZero() {
        // Given（前提条件：テストの準備・入力データ）
        var model = PrefectureCountModel()
        
        // When（実行：テスト対象のメソッドを呼び出す）
        model.updateCount(for: 1)
        
        // Then（検証：期待する結果を確認する）
        XCTAssertEqual(model.visitedCount(for: 1), 1)
    }
    
    func testUpdateCount_WhenExistingRecord_IncrementsByOne() {
        // Given（前提条件：テストの準備・入力データ）
        var model = PrefectureCountModel()
        model.setCount(5, for: 13)
        
        // When（実行：テスト対象のメソッドを呼び出す）
        model.updateCount(for: 13)
        
        // Then（検証：期待する結果を確認する）
        XCTAssertEqual(model.visitedCount(for: 13), 6)
    }
    
    func testUpdateCount_WithCustomIncrement() {
        // Given（前提条件：テストの準備・入力データ）
        var model = PrefectureCountModel()
        model.setCount(3, for: 1)
        
        // When（実行：テスト対象のメソッドを呼び出す）
        model.updateCount(for: 1, by: 5)
        
        // Then（検証：期待する結果を確認する）
        XCTAssertEqual(model.visitedCount(for: 1), 8)
    }
    
    func testUpdateCount_MultipleUpdates() {
        // Given（前提条件：テストの準備・入力データ）
        var model = PrefectureCountModel()
        
        // When（実行：テスト対象のメソッドを呼び出す）
        model.updateCount(for: 13)
        model.updateCount(for: 13)
        model.updateCount(for: 13, by: 3)
        
        // Then（検証：期待する結果を確認する）
        XCTAssertEqual(model.visitedCount(for: 13), 5)
    }
    
    // MARK: - visitedPrefectureNumbers Tests
    
    func testVisitedPrefectureNumbers_WhenNoRecords_ReturnsEmptySet() {
        // Given（前提条件：テストの準備・入力データ） & When（前提条件と実行：準備とメソッド呼び出し）
        let visited = model.visitedPrefectureNumbers
        
        // Then（検証：期待する結果を確認する）
        XCTAssertTrue(visited.isEmpty)
    }
    
    func testVisitedPrefectureNumbers_WhenSingleRecord_ReturnsCorrectSet() {
        // Given（前提条件：テストの準備・入力データ）
        var model = PrefectureCountModel()
        model.setCount(1, for: 13)
        
        // When（実行：テスト対象のメソッドを呼び出す）
        let visited = model.visitedPrefectureNumbers
        
        // Then（検証：期待する結果を確認する）
        XCTAssertEqual(visited.count, 1)
        XCTAssertTrue(visited.contains(13))
    }
    
    func testVisitedPrefectureNumbers_WhenMultipleRecords_ReturnsAllPrefectures() {
        // Given（前提条件：テストの準備・入力データ）
        var model = PrefectureCountModel()
        model.setCount(1, for: 1)
        model.setCount(5, for: 13)
        model.setCount(2, for: 27)
        
        // When（実行：テスト対象のメソッドを呼び出す）
        let visited = model.visitedPrefectureNumbers
        
        // Then（検証：期待する結果を確認する）
        XCTAssertEqual(visited.count, 3)
        XCTAssertTrue(visited.contains(1))
        XCTAssertTrue(visited.contains(13))
        XCTAssertTrue(visited.contains(27))
    }
    
    func testVisitedPrefectureNumbers_WhenCountIsZero_ExcludesFromSet() {
        // Given（前提条件：テストの準備・入力データ）
        var model = PrefectureCountModel()
        model.setCount(0, for: 1)
        model.setCount(1, for: 13)
        
        // When（実行：テスト対象のメソッドを呼び出す）
        let visited = model.visitedPrefectureNumbers
        
        // Then（検証：期待する結果を確認する）
        XCTAssertEqual(visited.count, 1)
        XCTAssertFalse(visited.contains(1))
        XCTAssertTrue(visited.contains(13))
    }
    
    func testVisitedPrefectureNumbers_WhenCountIsNegative_ExcludesFromSet() {
        // Given（前提条件：テストの準備・入力データ）
        var model = PrefectureCountModel()
        model.setCount(-1, for: 1)
        model.setCount(1, for: 13)
        
        // When（実行：テスト対象のメソッドを呼び出す）
        let visited = model.visitedPrefectureNumbers
        
        // Then（検証：期待する結果を確認する）
        XCTAssertEqual(visited.count, 1)
        XCTAssertFalse(visited.contains(1))
        XCTAssertTrue(visited.contains(13))
    }
    
    // MARK: - 異常系 Tests（不正な入力・範囲外の値）
    
    /// 異常系：存在しない都道府県番号（0）で訪問回数を取得しても0が返る
    func testVisitedCount_WithInvalidPrefectureNumberZero_ReturnsZero() {
        // Given（前提条件：テストの準備・入力データ）
        var model = PrefectureCountModel()
        model.setCount(1, for: 13)
        
        // When（実行：テスト対象のメソッドを呼び出す）
        let count = model.visitedCount(for: 0)
        
        // Then（検証：期待する結果を確認する）
        XCTAssertEqual(count, 0)
    }
    
    /// 異常系：範囲外の都道府県番号（48以上）で訪問回数を取得しても0が返る
    func testVisitedCount_WithOutOfRangePrefectureNumber_ReturnsZero() {
        // Given（前提条件：テストの準備・入力データ）
        var model = PrefectureCountModel()
        model.setCount(1, for: 13)
        
        // When（実行：テスト対象のメソッドを呼び出す）
        let count = model.visitedCount(for: 99)
        
        // Then（検証：期待する結果を確認する）
        XCTAssertEqual(count, 0)
    }
    
    /// 異常系：負の都道府県番号でsetCountしてもクラッシュせず保存される（現仕様）
    func testSetCount_WithNegativePrefectureNumber_DoesNotCrash() {
        // Given（前提条件：テストの準備・入力データ）
        var model = PrefectureCountModel()
        
        // When（実行：テスト対象のメソッドを呼び出す）
        model.setCount(1, for: -1)
        
        // Then（検証：期待する結果を確認する）
        XCTAssertEqual(model.visitedCount(for: -1), 1)
    }
    
    /// 異常系：負のカウント値をsetCountしてもクラッシュせず、visitedPrefectureNumbersには含まれない
    func testSetCount_WithNegativeCount_ExcludedFromVisitedPrefectures() {
        // Given（前提条件：テストの準備・入力データ）
        var model = PrefectureCountModel()
        model.setCount(-5, for: 13)
        
        // When（実行：テスト対象のメソッドを呼び出す）
        let visited = model.visitedPrefectureNumbers
        
        // Then（検証：期待する結果を確認する）
        XCTAssertEqual(model.visitedCount(for: 13), -5)
        XCTAssertFalse(visited.contains(13))
    }
    
    /// 異常系：updateCountで負の増分を指定した場合の振る舞い（現仕様では加算される）
    func testUpdateCount_WithNegativeIncrement_AddsToCurrent() {
        // Given（前提条件：テストの準備・入力データ）
        var model = PrefectureCountModel()
        model.setCount(10, for: 13)
        
        // When（実行：テスト対象のメソッドを呼び出す）
        model.updateCount(for: 13, by: -3)
        
        // Then（検証：期待する結果を確認する）
        XCTAssertEqual(model.visitedCount(for: 13), 7)
    }
}
