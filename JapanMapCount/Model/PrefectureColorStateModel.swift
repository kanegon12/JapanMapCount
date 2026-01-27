//
//  PrefectureColorStateModel.swift
//  JapanMapCount
//
//  Created by Newbie on 2026/01/27.
//

import Foundation
import RealmSwift

final class PrefectureColorStateModel: Object {
    
    @Persisted(primaryKey: true) var prefectureNumber: Int
    @Persisted private(set) var recordCount: Int = 0
    
    convenience init(prefectureNumber: Int) {
        self.init()
        self.prefectureNumber = prefectureNumber
    }
    
    func upCount() {
        recordCount += 1
    }
    
    func downCount() {
        recordCount = max(0, recordCount - 1)
    }
    
}
