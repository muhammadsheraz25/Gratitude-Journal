//
//  SettingsView.swift
//  CHALLENGE 2 GRATIFY
//
//  Created by Muhammad Sheraz Khan on 11/11/25.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationStack {
            Form {
                Section("About") {
                    Text("Gratify stores your notes privately on this device and works offline.")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }
            }
            .navigationTitle("Settings")
        }
    }
}

