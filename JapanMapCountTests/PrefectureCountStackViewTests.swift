//
//  PrefectureCountStackViewTests.swift
//  JapanMapCountTests
//
//  Created by Newbie on 2026/02/20.
//
// 正常系：0〜99の表示、100以上で"99+"
// 境界値：99と100
// 異常系：負の値（そのまま表示される現仕様）
//

import XCTest
@testable import JapanMapCount

final class PrefectureCountStackViewTests: XCTestCase {
    
    var stackView: PrefectureCountStackView!
    
    override func setUp() {
        super.setUp()
        stackView = PrefectureCountStackView()
    }
    
    override func tearDown() {
        stackView = nil
        super.tearDown()
    }
    
    // MARK: - formatCount Tests
    
    func testFormatCount_WithZero() {
        // Given & When（前提条件と実行：準備とメソッド呼び出し）
        let result = stackView.formatCount(0)
        
        // Then（検証：期待する結果を確認する）
        XCTAssertEqual(result, "0")
    }
    
    func testFormatCount_WithSingleDigit() {
        // Given & When（前提条件と実行：準備とメソッド呼び出し）
        let result = stackView.formatCount(5)
        
        // Then（検証：期待する結果を確認する）
        XCTAssertEqual(result, "5")
    }
    
    func testFormatCount_WithDoubleDigit() {
        // Given & When（前提条件と実行：準備とメソッド呼び出し）
        let result = stackView.formatCount(99)
        
        // Then（検証：期待する結果を確認する）
        XCTAssertEqual(result, "99")
    }
    
    func testFormatCount_WithCount100_Returns99Plus() {
        // Given & When（前提条件と実行：準備とメソッド呼び出し）
        let result = stackView.formatCount(100)
        
        // Then（検証：期待する結果を確認する）
        XCTAssertEqual(result, "99+")
    }
    
    func testFormatCount_WithCountOver100_Returns99Plus() {
        // Given & When（前提条件と実行：準備とメソッド呼び出し）
        let result = stackView.formatCount(150)
        
        // Then（検証：期待する結果を確認する）
        XCTAssertEqual(result, "99+")
    }
    
    func testFormatCount_WithLargeCount_Returns99Plus() {
        // Given & When（前提条件と実行：準備とメソッド呼び出し）
        let result = stackView.formatCount(1000)
        
        // Then（検証：期待する結果を確認する）
        XCTAssertEqual(result, "99+")
    }
    
    func testFormatCount_BoundaryValue99() {
        // Given & When（前提条件と実行：準備とメソッド呼び出し）
        let result = stackView.formatCount(99)
        
        // Then（検証：期待する結果を確認する）
        XCTAssertEqual(result, "99")
    }
    
    func testFormatCount_BoundaryValue100() {
        // Given & When（前提条件と実行：準備とメソッド呼び出し）
        let result = stackView.formatCount(100)
        
        // Then（検証：期待する結果を確認する）
        XCTAssertEqual(result, "99+")
    }
    
    // 異常系：負のカウント（現仕様ではそのまま文字列化して表示）
    func testFormatCount_WithNegativeValue() {
        // Given & When（前提条件と実行：準備とメソッド呼び出し）
        let result = stackView.formatCount(-1)
        
        // Then（検証：期待する結果を確認する）
        XCTAssertEqual(result, "-1")
    }
    
}
