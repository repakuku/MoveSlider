//
//  ContentView.swift
//  MoveSlider
//
//  Created by Алексей Турулин on 7/28/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var gameViewModel = GameViewModel()
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Подвиньте слайдер как можно ближе к: \(gameViewModel.game.targetValue)")
            
            SliderView(gameViewModel: gameViewModel)

            Button("Проверь меня!") {
                gameViewModel.showAlert()
            }
            .alert("Ваш счёт", isPresented: $gameViewModel.alertPresented) {
                Button("Ok") {
                    gameViewModel.startNewGame()
                }
            } message: {
                Text("\(gameViewModel.computeScore())")
            }
            
            Button("Начать заново") {
                gameViewModel.startNewGame()
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
