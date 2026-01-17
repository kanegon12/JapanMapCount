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
    
    func modelSaveProcess(recordDate: Date, recordText: String) {
        // 新規か更新か判断
        guard let realm = self.realm else {
            // 新規
            self.recordDate = recordDate
            self.recordText = recordText
            return
        }
        // 更新
            try! realm.write {
                self.recordDate = recordDate
                self.recordText = recordText
        }
    }
}

