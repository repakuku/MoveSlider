//
//  SliderView.swift
//  MoveSlider
//
//  Created by Алексей Турулин on 7/28/23.
//

import SwiftUI

struct SliderView: View {
    @EnvironmentObject private var game: Game
    
    var body: some View {
        HStack {
            Text("0")
            UISliderViewRepresentation()
            Text("100")
        }
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView()
            .environmentObject(Game())
    }
}
