//
//  TodayView.swift
//  CHALLENGE 2 GRATIFY
//
//  Created by Muhammad Sheraz Khan on 11/11/25.
//

import SwiftUI
import UIKit // helps dismiss the keyboard

struct TodayView: View {
    @ObservedObject var store: EntriesStore
    @State private var text: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            
            Image(systemName: "heart.fill")
                .foregroundColor(.red)
                .font(.title)
            
            Text("Good day, There!")
                .font(.title2)
                .bold()
            
            Text("What are you grateful for today?")
                .foregroundColor(.secondary)
            
            // Text input
            TextField("I'm grateful for...", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
                .submitLabel(.done)
                .onSubmit {
                    hideKeyboard()
                }
            
            // Add button
            Button("Add") {
                let trimmed = text.trimmingCharacters(in: .whitespacesAndNewlines)
                guard !trimmed.isEmpty else { return }
                store.add(trimmed)
                text = ""
                hideKeyboard()
            }
            .buttonStyle(.borderedProminent)
            .padding(.top)
            
            Spacer()
        }
        .padding()
        .contentShape(Rectangle()) // allows tap anywhere
        .onTapGesture {
            hideKeyboard() // hides keyboard when tapping outside
        }
    }
}

// MARK: - Keyboard Hiding Extension
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
                                        to: nil, from: nil, for: nil)
    }
}

// MARK: - Preview
#Preview {
    TodayView(store: EntriesStore())
}






