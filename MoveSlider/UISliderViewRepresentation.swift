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
        let alpha = Double(game.computeScore()) / 100.0
        
        uiSlider.minimumValue = 0
        uiSlider.maximumValue = 100
        uiSlider.thumbTintColor = UIColor(
            red: 255,
            green: 0,
            blue: 0,
            alpha: alpha
        )
        uiSlider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.didValueChanged),
            for: .valueChanged
        )
        
        return uiSlider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        let alpha = Double(game.computeScore()) / 100.0
        uiView.setValue(Float(game.currentValue), animated: true)
        uiView.thumbTintColor = UIColor(
            red: 255,
            green: 0,
            blue: 0,
            alpha: alpha
        )
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(game: _game)
    }
    
}

struct UISliderViewRepresentation_Previews: PreviewProvider {
    static var previews: some View {
        UISliderViewRepresentation()
            .environmentObject(Game())
    }
}

extension UISliderViewRepresentation {
    class Coordinator: NSObject {
        @EnvironmentObject var game: Game
        
        init(game: EnvironmentObject<Game>) {
            self._game = game
        }
        
        @objc func didValueChanged(_ sender: UISlider) {
            game.currentValue = Double(sender.value)
        }
    }
}
