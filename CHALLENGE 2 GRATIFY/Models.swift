//
//  Models.swift
//  CHALLENGE 2 GRATIFY
//
//  Created by Muhammad Sheraz Khan on 11/11/25.
//

import Foundation

struct GratitudeEntry: Identifiable, Codable, Equatable {
    var id = UUID()
    var date: Date
    var text: String
}
