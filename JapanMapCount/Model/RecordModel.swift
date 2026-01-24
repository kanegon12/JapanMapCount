//
//  RecordModel.swift
//  JapanMapCount
//
//  Created by Newbie on 2026/01/10.
//

import Foundation
import RealmSwift
import Realm

final class RecordModel: Object {
    
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted private(set) var prefectureNumber: Int = 0
    @Persisted private(set) var recordDate: Date = Date()
    @Persisted private(set) var recordText: String = ""
    
    private var prefecture: Prefecture? {
        Prefecture(rawValue: prefectureNumber)
    }
    
    convenience init(prefecture: Prefecture, recordDate: Date, recordText: String) {
        self.init()
        self.prefectureNumber = prefecture.rawValue
        self.recordDate = recordDate
        self.recordText = recordText
    }
    /// 外部からrecordDateとrecordTextを変更するため
    func updateRecord(recordDate: Date, recordText: String) {
        self.recordDate = recordDate
        self.recordText = recordText
    }
    /// 外部からprefectureNumberを変更するため
    func updatePrefectureNumber(prefectureNumber: Int) {
        self.prefectureNumber = prefectureNumber
    }
}

