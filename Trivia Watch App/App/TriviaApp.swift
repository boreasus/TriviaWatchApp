//
//  TriviaApp.swift
//  Trivia Watch App
//
//  Created by safa uslu on 10.06.2023.
//

import SwiftUI

@main
struct Trivia_Watch_AppApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }.environmentObject(ViewModel())
        }
    }
}
