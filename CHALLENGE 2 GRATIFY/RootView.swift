//
//  RootView.swift
//  CHALLENGE 2 GRATIFY
//
//  Created by Muhammad Sheraz Khan on 11/11/25.
//

import SwiftUI

struct RootView: View {
    @StateObject var store = EntriesStore()

    var body: some View {
        TabView {
            TodayView(store: store)
                .tabItem {
                    Label("Today", systemImage: "heart.fill")
                }

            PastEntriesView(store: store)
                .tabItem {
                    Label("Past Entries", systemImage: "clock.fill")
                }

            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape.fill")
                }
        }
    }
}

#Preview {
    RootView()
}

