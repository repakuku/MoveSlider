//
//  SliderView.swift
//  MoveSlider
//
//  Created by Алексей Турулин on 7/28/23.
//

import SwiftUI

struct SliderView: View {
    @ObservedObject var gameViewModel: GameViewModel
    
    var body: some View {
        HStack {
            Text("0")
            UISliderViewRepresentation(
                value: $gameViewModel.game.currentValue,
                score: gameViewModel.computeScore(),
                alpha: Double(gameViewModel.computeScore()) / 100
            )
            Text("100")
        }
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView(gameViewModel: GameViewModel())
    }
}
