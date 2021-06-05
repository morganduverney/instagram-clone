//
//  AnalyticsManager.swift
//  InstagramClone
//
//  Created by Morgan Duverney on 6/4/21.
//

import FirebaseAnalytics
import Foundation

final class AnalyticsManager {
    static let shared = AnalyticsManager()
    
    private init() {}
    
    func logEvent() {
        Analytics.logEvent("", parameters: [:])
    }
}
