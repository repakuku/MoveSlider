//
//  Game.swift
//  MoveSlider
//
//  Created by Алексей Турулин on 7/28/23.
//

import Foundation

final class Game: ObservableObject {
    @Published var targetValue = Int.random(in: 0...100)
    @Published var currentValue = Double.random(in: 0...100)
    
    func startNewGame() {
        targetValue = Int.random(in: 0...100)
        currentValue = Double.random(in: 0...100)
    }
    
    func computeScore() -> Int {
        let difference = abs(targetValue - lround(currentValue))
        return 100 - difference
    }
}
