//
//  Utils.swift
//  YtClone
//
//  Created by DHEERAJ on 11/12/25.
//

import Foundation

func cleanConfigValue(_ rawValue: String?) -> String? {
    guard var value = rawValue else { return nil }

    // 1. Remove leading/trailing quotes (The Fix for your issue!)
    if value.hasPrefix("\"") && value.hasSuffix("\"") {
        value.removeFirst()
        value.removeLast()
    }

    // 2. Remove any surrounding whitespace/newlines (Good practice)
    return value.trimmingCharacters(in: .whitespacesAndNewlines)
}

func safeTruncate(_ text: String, maxLength: Int) -> String {
    guard text.count > maxLength else { return text }
    let index = text.index(text.startIndex, offsetBy: maxLength)
    return String(text[..<index]) + "..."
}
