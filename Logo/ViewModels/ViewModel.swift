//
//  ViewModel.swift
//  Logo
//
//  Created by tanvi tuteja on 14/08/21.
//

import Foundation

protocol GameViewModelDelegate {
    func showLoader()
    func hideLoader()
    func didEndGame()
    func showPopUp()
}

class GameViewModel {
    var game: LogoGame?
    var delegate: GameViewModelDelegate?
    var service = LogoNetworkService()
    
    init() {
        service.delegate = self
    }
    
    func startGame() {
        delegate?.showLoader()
        service.fetchLogoData()
        
    }
    
    func getLevelDetails() -> LevelDetails? {
        return self.game?.getCurrentLevelDetails()
    }
    
    func getRandomLetters() {
        
    }
    
    func checkAnswer(ans: String) {
        
    }

    func pauseGame() {
        
    }
    
}


extension GameViewModel : LogoNetworkServiceDelegate {
    func didSuccessfullyFetchData(data: [LogoData]) {
        delegate?.hideLoader()
        self.game = LogoGame(logoData: data)
        self.game?.start()
        
    }
    
    func didFailedToFetchData(_ error: Error?) {
        
    }
}
 
