//
//  LevelDetails.swift
//  Logo
//
//  Created by tanvi tuteja on 14/08/21.
//

import Foundation

class LevelDetails {
    var islocked: Bool = false
    var levelId: Int
    var logoData: LogoData
    var bestTime: TimeInterval?
    var levelStartTime: Date?
    
    init(levelId: Int, logoData: LogoData) {
        self.levelId = levelId
        self.logoData = logoData
    }
    
    func getTimeTaken() -> TimeInterval {
        bestTime = max( bestTime ?? TimeInterval(Int.max), -(levelStartTime?.timeIntervalSinceNow ?? TimeInterval(Int.max)))
        return -(levelStartTime?.timeIntervalSinceNow ?? 0)
    }
}
