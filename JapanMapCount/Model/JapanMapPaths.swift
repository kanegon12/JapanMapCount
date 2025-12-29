//
//  JapanMapPaths.swift
//  JapanMapCount
//
//  Created by Newbie on 2025/12/27.
//

import UIKit

enum Prefecture: Int, CaseIterable {
    case hokkaido = 1
}

enum JapanMapPaths {
    
    static func path(for prefecture: Prefecture) -> UIBezierPath {
        switch prefecture {
        case .hokkaido:
            return makeHokkaidoPath()
        }
    }
}

func makeHokkaidoPath() -> UIBezierPath {
    let path = UIBezierPath()
    path.move(to: CGPoint(x: 843.1, y: 436.82))
    path.addLine(to: CGPoint(x: 843.36, y: 663.07))
    path.addLine(to: CGPoint(x: 846.83, y: 675.61))
    path.addLine(to: CGPoint(x: 851.9, y: 684.42))
    path.addLine(to: CGPoint(x: 859.1, y: 691.62))
    path.addLine(to: CGPoint(x: 868.71, y: 696.42))
    path.addLine(to: CGPoint(x: 1081.36, y: 695.62))
    path.addLine(to: CGPoint(x: 1092.83, y: 689.22))
    path.addLine(to: CGPoint(x: 1100.03, y: 679.88))
    path.addLine(to: CGPoint(x: 1104.3, y: 670.28))
    path.addLine(to: CGPoint(x: 1106.97, y: 659.6))
    path.addLine(to: CGPoint(x: 1106.44, y: 437.09))
    path.addLine(to: CGPoint(x: 1104.03, y: 426.68))
    path.addLine(to: CGPoint(x: 1100.03, y: 417.88))
    path.addLine(to: CGPoint(x: 1094.43, y: 409.34))
    path.addLine(to: CGPoint(x: 1087.23, y: 403.47))
    path.addLine(to: CGPoint(x: 1080.02, y: 400))
    path.addLine(to: CGPoint(x: 868.18, y: 400))
    path.addLine(to: CGPoint(x: 860.44, y: 404.27))
    path.addLine(to: CGPoint(x: 855.64, y: 408.8))
    path.addLine(to: CGPoint(x: 850.03, y: 416.01))
    path.addLine(to: CGPoint(x: 847.63, y: 421.08))
    path.addLine(to: CGPoint(x: 844.16, y: 428.28))
    path.addLine(to: CGPoint(x: 843.1, y: 436.82))
    path.close()
    return path
}
