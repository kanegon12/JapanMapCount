//
//  PrefectureCountStackViewStoreTests.swift
//  JapanMapCountTests
//
//  Created by Newbie on 2026/02/20.
//

import XCTest
@testable import JapanMapCount

final class PrefectureCountStackViewStoreTests: XCTestCase {
    
    var store: PrefectureCountStackViewStore!
    
    override func setUp() {
        super.setUp()
        store = PrefectureCountStackViewStore()
    }
    
    override func tearDown() {
        store = nil
        super.tearDown()
    }
    
    // MARK: - getOrCreate Tests
    
    func testGetOrCreate_FirstCall_CreatesNewStackView() {
        // Given（前提条件：テストの準備・入力データ）
        var store = PrefectureCountStackViewStore()
        var createCallCount = 0
        
        // When（実行：テスト対象のメソッドを呼び出す）
        let stackView = store.getOrCreate(for: .tokyo) {
            createCallCount += 1
            return PrefectureCountStackView()
        }
        
        // Then（検証：期待する結果を確認する）
        XCTAssertNotNil(stackView)
        XCTAssertEqual(createCallCount, 1)
    }
    
    func testGetOrCreate_SecondCall_ReturnsExistingStackView() {
        // Given（前提条件：テストの準備・入力データ）
        var store = PrefectureCountStackViewStore()
        var createCallCount = 0
        let firstStackView = store.getOrCreate(for: .tokyo) {
            createCallCount += 1
            return PrefectureCountStackView()
        }
        
        // When（実行：テスト対象のメソッドを呼び出す）
        let secondStackView = store.getOrCreate(for: .tokyo) {
            createCallCount += 1
            return PrefectureCountStackView()
        }
        
        // Then（検証：期待する結果を確認する）
        XCTAssertEqual(createCallCount, 1)
        XCTAssertTrue(firstStackView === secondStackView, "同じインスタンスが返されるべき")
    }
    
    func testGetOrCreate_DifferentPrefectures_CreatesSeparateStackViews() {
        // Given（前提条件：テストの準備・入力データ）
        var store = PrefectureCountStackViewStore()
        var createCallCount = 0
        
        // When（実行：テスト対象のメソッドを呼び出す）
        let tokyoStackView = store.getOrCreate(for: .tokyo) {
            createCallCount += 1
            return PrefectureCountStackView()
        }
        let osakaStackView = store.getOrCreate(for: .osaka) {
            createCallCount += 1
            return PrefectureCountStackView()
        }
        
        // Then（検証：期待する結果を確認する）
        XCTAssertEqual(createCallCount, 2)
        XCTAssertFalse(tokyoStackView === osakaStackView, "異なるインスタンスが返されるべき")
    }
    
    func testGetOrCreate_AllPrefectures() {
        // Given（前提条件：テストの準備・入力データ）
        var store = PrefectureCountStackViewStore()
        var createCallCount = 0
        
        // When（実行：テスト対象のメソッドを呼び出す）
        for prefecture in Prefecture.allCases {
            _ = store.getOrCreate(for: prefecture) {
                createCallCount += 1
                return PrefectureCountStackView()
            }
        }
        
        // Then（検証：期待する結果を確認する）
        XCTAssertEqual(createCallCount, Prefecture.allCases.count)
    }
    
    func testGetOrCreate_ReusesAfterMultipleCalls() {
        // Given（前提条件：テストの準備・入力データ）
        var store = PrefectureCountStackViewStore()
        var createCallCount = 0
        
        // When（実行：テスト対象のメソッドを呼び出す）
        let first = store.getOrCreate(for: .tokyo) {
            createCallCount += 1
            return PrefectureCountStackView()
        }
        let second = store.getOrCreate(for: .tokyo) {
            createCallCount += 1
            return PrefectureCountStackView()
        }
        let third = store.getOrCreate(for: .tokyo) {
            createCallCount += 1
            return PrefectureCountStackView()
        }
        
        // Then（検証：期待する結果を確認する）
        XCTAssertEqual(createCallCount, 1)
        XCTAssertTrue(first === second && second === third, "すべて同じインスタンスが返されるべき")
    }
    
    func testGetOrCreate_WithHokkaido() {
        // Given（前提条件：テストの準備・入力データ）
        var store = PrefectureCountStackViewStore()
        var createCallCount = 0
        
        // When（実行：テスト対象のメソッドを呼び出す）
        let stackView = store.getOrCreate(for: .hokkaido) {
            createCallCount += 1
            return PrefectureCountStackView()
        }
        
        // Then（検証：期待する結果を確認する）
        XCTAssertNotNil(stackView)
        XCTAssertEqual(createCallCount, 1)
    }
    
    func testGetOrCreate_WithOkinawa() {
        // Given（前提条件：テストの準備・入力データ）
        var store = PrefectureCountStackViewStore()
        var createCallCount = 0
        
        // When（実行：テスト対象のメソッドを呼び出す）
        let stackView = store.getOrCreate(for: .okinawa) {
            createCallCount += 1
            return PrefectureCountStackView()
        }
        
        // Then（検証：期待する結果を確認する）
        XCTAssertNotNil(stackView)
        XCTAssertEqual(createCallCount, 1)
    }
}
