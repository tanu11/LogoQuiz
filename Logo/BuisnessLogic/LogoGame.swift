//
//  LogoGame.swift
//  Logo
//
//  Created by tanvi tuteja on 14/08/21.
//

import Foundation


// struct to store default value
struct GameConfiguration {
    var numberOfLevels: Int = 5
    var totalLettersShown: Int = 20
    var totalHints: Int = 4
    var levelTimer: Int = 1000
    var maxLevelScore = 40
}

enum GameState {
    case none
    case started
    case paused
    case ended
}


class LogoGame {
    var levelsDetails: [LevelDetails]
    var logoData: [LogoData]
    var configuration: GameConfiguration = GameConfiguration()
    var currentLevel: Int = 0
    var hintsAvailed: Int = 0
    var gameScore: Int = 0
    
    var gameState: GameState = .none

    

    init(logoData: [LogoData], gameConfiguration: GameConfiguration = GameConfiguration()) {
        self.logoData = logoData
        self.configuration = gameConfiguration
        levelsDetails = []
    }
    
    public func start() {
        gameState = .started
        levelsDetails = self.getLevelDetails(logoData: logoData)
    }
    
    public func pause() {
        gameState = .paused
    }
    
    public func nextLevel() -> LevelDetails? {
        guard currentLevel < self.configuration.numberOfLevels else {
            endGame()
            return nil
        }
        
        defer {
            currentLevel += 1
        }
        
        return levelsDetails[currentLevel]
    }
    
    public func getCurrentLevelDetails() -> LevelDetails? {
        if gameState == .ended {
            return nil
        }
        
        return levelsDetails[currentLevel]
    }
    
    public func setTimeForLevel(level: Int) {
        
        
    }
    
    public func submmitAnswerForlevel(forlevel level: Int, ans: String)  {
        gameScore += calculateScore(level: level, timeTaken: levelsDetails[level].getTimeTaken())
        
    }
    
    public func resumeGame() {
        gameState = .started
    }
    
    public func endGame() {
        gameState = .ended
    }
    
}


private extension LogoGame {
    
    private func generateRandomLetters(forLogoName logoName: String) -> String {
        var letters = logoName
        let remainingLetters =  self.configuration.totalLettersShown
        for _ in 0 ..< remainingLetters {
            let randomLetter = generateRandomLetter()
            letters += "\(randomLetter)"
        }
        return letters
    }
    
    private func generateRandomLetter() -> Character {
        let characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        let randomNum = Int.random(in: 0..<characters.count)
        return Array(characters)[randomNum]
    }
    
    private func getLevelDetails(logoData: [LogoData]) -> [LevelDetails] {
        levelsDetails = []
        for (index,logo) in logoData.enumerated() {
            levelsDetails.append(LevelDetails(levelId: index, logoData: logo))
        }
        return levelsDetails
    }
    
    private func checkAnswer(forlevel level: Int, ans: String) -> Bool {
        return levelsDetails[level].logoData.logoName == ans
    }
    
    private func calculateScore(level: Int, timeTaken: TimeInterval) ->Int {
        return level * self.configuration.levelTimer/Int(timeTaken)
    }
}
