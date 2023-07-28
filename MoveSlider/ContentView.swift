//
//  ContentView.swift
//  MoveSlider
//
//  Created by Алексей Турулин on 7/28/23.
//

import SwiftUI

struct ContentView: View {
    @State private var targetValue = Int.random(in: 0...100)
    @State private var currentValue = Double.random(in: 0...100)
    @State private var alertPresented = false
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Подвиньте слайдер как можно ближе к: \(targetValue)")
            
            Slider(value: $currentValue, in: 0...100, step: 1) {

            } minimumValueLabel: {
                Text("0")
            } maximumValueLabel: {
                Text("100")
            }

            Button("Проверь меня!") {
                alertPresented.toggle()
            }
            .alert("Ваш счёт", isPresented: $alertPresented) {
                Button("Ok") {
                    startNewGame()
                }
            } message: {
                Text("\(computeScore())")
            }
            
            Button("Начать заново") {
                startNewGame()
            }
        }
        .padding()
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(currentValue))
        return 100 - difference
    }
    
    private func startNewGame() {
        targetValue = Int.random(in: 0...100)
        currentValue = Double.random(in: 0...100)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
