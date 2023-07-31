//
//  Game.swift
//  MoveSlider
//
//  Created by Алексей Турулин on 7/28/23.
//

import Foundation

final class GameViewModel: ObservableObject {
    @Published var game = Game()
    @Published var alertPresented = false
    
    func startNewGame() {
        game.targetValue = Game().targetValue
        game.currentValue = Game().currentValue
    }
    
    func computeScore() -> Int {
        let difference = abs(game.targetValue - lround(game.currentValue))
        return 100 - difference
    }
    
    func showAlert() {
        alertPresented.toggle()
    }
}
