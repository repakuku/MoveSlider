//
//  UISliderViewRepresentation.swift
//  MoveSlider
//
//  Created by Алексей Турулин on 7/28/23.
//

import SwiftUI

struct UISliderViewRepresentation: UIViewRepresentable {
    @EnvironmentObject private var game: Game
    
    func makeUIView(context: Context) -> UISlider {
        let uiSlider = UISlider()
        
        uiSlider.minimumValue = 0
        uiSlider.maximumValue = 100
        
        return uiSlider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.setValue(Float(game.currentValue), animated: true)
    }
    
}

struct UISliderViewRepresentation_Previews: PreviewProvider {
    static var previews: some View {
        UISliderViewRepresentation()
            .environmentObject(Game())
    }
}
