//
//  SliderView.swift
//  MoveSlider
//
//  Created by Алексей Турулин on 7/28/23.
//

import SwiftUI

struct GameSliderView: View {
    @ObservedObject var gameViewModel: GameViewModel
    
    var body: some View {
        HStack {
            Text("0")
            UISliderViewRepresentation(
                value: $gameViewModel.game.currentValue,
                alpha: gameViewModel.alpha
            )
            Text("100")
        }
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        GameSliderView(gameViewModel: GameViewModel())
    }
}
