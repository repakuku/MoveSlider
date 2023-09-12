//
//  ContentView.swift
//  MoveSlider
//
//  Created by Алексей Турулин on 7/28/23.
//

import SwiftUI

struct GameView: View {
    @StateObject private var gameViewModel = GameViewModel()
    
    var body: some View {
        ZStack {
            Color(uiColor: .systemFill)
                .ignoresSafeArea()
            VStack(spacing: 30) {
                Text("Move slider as close to: \(gameViewModel.game.targetValue)")
                
                GameSliderView(gameViewModel: gameViewModel)

                Button("Check me!") {
                    gameViewModel.showAlert()
                }
                .alert(
                    "Start Again",
                    isPresented: $gameViewModel.alertPresented
                ) {
                    Button("Ok") {
                        gameViewModel.startNewGame()
                    }
                } message: {
                    Text("Score: \(gameViewModel.scores)")
                }
                
                Button("Start Again") {
                    gameViewModel.startNewGame()
                }
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
