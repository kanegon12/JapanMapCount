//
//  UIColor+HexColorCode.swift
//  JapanMapCount
//
//  Created by Newbie on 2026/01/28.
//

import UIKit

extension UIColor {
    convenience init(hex: UInt32, alpha: CGFloat = 1.0) {
        let red = CGFloat((hex & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((hex & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(hex & 0x0000FF) / 255.0
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}

extension UIColor {
    // MapViewの背景色
    static let mapViewBackgroundBlue = UIColor(hex: 0x9cece4)
    // 都道府県塗り潰しの色
    static let hokkaidoGreen = UIColor(hex: 0x7FFFD4)
    static let tohokuBlue = UIColor(hex: 0x3cebfb)
    static let kantoBulue = UIColor(hex: 0x4bb4fb)
    static let chubuPurple = UIColor(hex: 0xa68ed7)
    static let kinkiPink = UIColor(hex: 0xfb88c2)
    static let chugokuPink = UIColor(hex: 0xf5b3b3)
    static let shikokuPink = UIColor(hex: 0xed8282)
    static let kyusyuYellow = UIColor(hex: 0xf9d9a9)
    // assistanceMessageカラー
    static let assistanceGray = UIColor(hex: 0x333333)
}
