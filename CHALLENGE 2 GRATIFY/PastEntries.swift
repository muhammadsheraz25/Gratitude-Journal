//
//  PastEntries.swift
//  CHALLENGE 2 GRATIFY
//
//  Created by Muhammad Sheraz Khan on 11/11/25.
//

import SwiftUI

struct PastEntriesView: View {
    @ObservedObject var store: EntriesStore

    var body: some View {
        List {
            ForEach(store.entries) { entry in
                VStack(alignment: .leading, spacing: 6) {
                    Text(entry.text)
                        .font(.body)

                    Text(entry.date.formatted(date: .abbreviated, time: .shortened))
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
            .onDelete(perform: store.delete)
        }
    }
}

#Preview {
    PastEntriesView(store: EntriesStore())
}


