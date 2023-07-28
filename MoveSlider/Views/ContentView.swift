//
//  ContentView.swift
//  MoveSlider
//
//  Created by Алексей Турулин on 7/28/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var game: Game
    @State private var alertPresented = false
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Подвиньте слайдер как можно ближе к: \(game.targetValue)")
            
            SliderView()

            Button("Проверь меня!") {
                alertPresented.toggle()
            }
            .alert("Ваш счёт", isPresented: $alertPresented) {
                Button("Ok") {
                    game.startNewGame()
                }
            } message: {
                Text("\(game.computeScore())")
            }
            
            Button("Начать заново") {
                game.startNewGame()
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Game())
    }
}
