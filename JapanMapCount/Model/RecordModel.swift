//
//  RecordModel.swift
//  JapanMapCount
//
//  Created by Newbie on 2026/01/10.
//

import Foundation

final class RecordModel {
    private(set) var recordDate: Date
    private(set) var recordText: String
    
    init(recordDate: Date, recordText: String) {
        self.recordDate = recordDate
        self.recordText = recordText
    }
    func updateModel(recordDate: Date, recordText: String) {
        self.recordDate = recordDate
        self.recordText = recordText
    }
    
}

