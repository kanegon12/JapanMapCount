//
//  JapanMapViewDelegate.swift
//  JapanMapCount
//
//  Created by Newbie on 2026/01/07.
//

import Foundation

protocol JapanmapViewDelegate: AnyObject {
    func japanMapView(_ mapView: JapanMapView, didTap prefecture: Prefecture)
}
