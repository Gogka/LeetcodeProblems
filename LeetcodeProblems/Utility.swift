//
//  Utility.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 29.12.2022.
//

import Foundation

struct TextError: Error, CustomStringConvertible, CustomDebugStringConvertible, LocalizedError {
    let text: String
    var description: String { text }
    var debugDescription: String { text }
    var errorDescription: String? { text }
}
