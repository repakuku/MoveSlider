//
//  UISliderViewRepresentation.swift
//  MoveSlider
//
//  Created by Алексей Турулин on 7/28/23.
//

import SwiftUI

struct UISliderViewRepresentation: UIViewRepresentable {
    
    @Binding var value: Double
    
    let score: Int
    let alpha: Double
    
    func makeUIView(context: Context) -> UISlider {
        let uiSlider = UISlider()

        uiSlider.minimumValue = 0
        uiSlider.maximumValue = 100
        uiSlider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.didChangeSliderValue),
            for: .valueChanged
        )
        
        return uiSlider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.setValue(Float(value), animated: true)
        uiView.thumbTintColor = UIColor.red.withAlphaComponent(alpha)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: _value)
    }
    
}

struct UISliderViewRepresentation_Previews: PreviewProvider {
    static var previews: some View {
        UISliderViewRepresentation(value: .constant(10), score: 50, alpha: 1)
    }
}

extension UISliderViewRepresentation {
    class Coordinator: NSObject {
        @Binding var value: Double
        
        init(value: Binding<Double>) {
            self._value = value
        }
        
        @objc func didChangeSliderValue(_ sender: UISlider) {
            value = Double(sender.value)
        }
    }
}
