//
//  CHALLENGE_2_GRATIFYApp.swift
//  CHALLENGE 2 GRATIFY
//
//  Created by Muhammad Sheraz Khan on 07/11/25.
//

import SwiftUI

@main
struct CHALLENGE_2_GRATIFYApp: App {
    @StateObject private var store = EntriesStore()

    var body: some Scene {
        WindowGroup {
            RootView()                    // <-- our tab bar
                .environmentObject(store) // <-- inject store
        }
    }
}

