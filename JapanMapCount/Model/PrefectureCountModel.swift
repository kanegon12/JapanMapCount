//
//  PrefectureCountModel.swift
//  JapanMapCount
//
//  Created by Newbie on 2026/02/06.
//

import Foundation
import RealmSwift

/// 訪問回数管理
struct PrefectureCountModel {
    /// key: 都道府県番号, value: 訪問回数
    private(set) var counts: [Int: Int] = [:]
    
    init() {}
    
    /// Realm の辞書化
    init(results: Results<PrefectureColorStateModel>) {
        counts.reserveCapacity(results.count)
        for state in results {
            counts[state.prefectureNumber] = state.recordCount
        }
    }
    
    /// 訪問回数
    func visitedCount(for prefectureNumber: Int) -> Int {
        // 訪問記録がなし(nil)の場合は0を返す
        counts[prefectureNumber] ?? 0
    }
    
    /// 都道府県毎のカウント設定
    mutating func setCount(_ value: Int, for prefectureNumber: Int) {
        counts[prefectureNumber] = value
    }
    
    /// カウント更新
    mutating func updateCount(for prefectureNumber: Int, by count: Int = 1) {
        let current = counts[prefectureNumber] ?? 0
        counts[prefectureNumber] = current + count
    }
    
    /// 1回以上訪れた都道府県番号の集合
    var visitedPrefectureNumbers: Set<Int> {
        Set(counts.filter { $0.value >= 1 }.map { $0.key })
    }
}
