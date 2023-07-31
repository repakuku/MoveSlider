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
    
    var scores: Int {
        100 - abs(game.targetValue - lround(game.currentValue))
    }
    
    var alpha: Double {
        (100 - abs(Double(game.targetValue) - game.currentValue)) / 100
    }
    
    func startNewGame() {
        game.targetValue = Int.random(in: 0...100)
        game.currentValue = Double.random(in: 0...100)
    }
    
    func showAlert() {
        alertPresented.toggle()
    }
}
