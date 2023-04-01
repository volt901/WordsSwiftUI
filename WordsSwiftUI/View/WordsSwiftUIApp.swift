//
//  WordsSwiftUIApp.swift
//  WordsSwiftUI
//
//  Created by Владимир Ширяев on 25.03.2023.
//

import SwiftUI

@main
struct WordsSwiftUIApp: App {
    var body: some Scene {
        let _ = print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.path)
        WindowGroup {
            ContentView()
                .preferredColorScheme(.light)
        }
    }
}
