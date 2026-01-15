//
//  RecordListCell.swift
//  JapanMapCount
//
//  Created by Newbie on 2026/01/10.
//

import UIKit

class RecordListCell: UITableViewCell {
    @IBOutlet weak var recordDateLabel: UILabel!
    @IBOutlet weak var recordTextLabel: UILabel!
    
    
    private var model: RecordModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // 改行を2列に
        recordTextLabel.numberOfLines = 2
    }

    func configure(recordModel: RecordModel) {
        self.model = recordModel
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy年MM月dd日"
        self.recordDateLabel.text = formatter.string(from: recordModel.recordDate)
        self.recordTextLabel.text = recordModel.recordText
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
