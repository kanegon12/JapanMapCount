//
//  PrefectureCountStackViewStore.swift
//  JapanMapCount
//
//  Created by Newbie on 2026/02/17.
//

import UIKit

struct PrefectureCountStackViewStore {
    // rawValue が 1...47 なので 0 は使わない。48個確保しておく
    private var stackView: [PrefectureCountStackView?] = Array(repeating: nil, count: 48)
    
    mutating func getOrCreate(for prefecture: Prefecture, create: () -> PrefectureCountStackView) -> PrefectureCountStackView {
        let index = prefecture.rawValue
        // nilチェックと新規作成
        if let existing = stackView[index] { return existing }
        let newStackView = create()
        stackView[index] = newStackView
        return newStackView
    }
    
}
