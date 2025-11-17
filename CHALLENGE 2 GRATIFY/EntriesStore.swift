//
//  EntriesStore.swift
//  CHALLENGE 2 GRATIFY
//
//  Created by Muhammad Sheraz Khan on 11/11/25.
//
import SwiftUI
import Foundation
import Combine

final class EntriesStore: ObservableObject {
    @Published var entries: [GratitudeEntry] = [] {
        didSet { persist() }
    }

    private let key = "gratify.entries.v1"

    init() { restore() }

    func add(_ text: String) {
        let t = text.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !t.isEmpty else { return }
        let new = GratitudeEntry(date: Date(), text: t)
        entries.append(new)
        entries.sort { $0.date < $1.date } // oldest first
    }

    func delete(at offsets: IndexSet) {
        entries.remove(atOffsets: offsets)
    }

    // MARK: - Persistence
    private func persist() {
        do {
            let data = try JSONEncoder().encode(entries)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print("Persist error:", error)
        }
    }

    private func restore() {
        guard let data = UserDefaults.standard.data(forKey: key) else { return }
        do {
            entries = try JSONDecoder().decode([GratitudeEntry].self, from: data)
        } catch {
            print("Restore error:", error)
        }
    }
}

