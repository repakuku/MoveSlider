//
//  MoveSliderApp.swift
//  MoveSlider
//
//  Created by Алексей Турулин on 7/28/23.
//

import SwiftUI

@main
struct MoveSliderApp: App {
    @StateObject private var game = Game()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(game)
        }
    }
}
