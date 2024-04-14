//
//  WordPattern.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 13.04.2024.
//

import Foundation

final class WordPattern {
    /// ✅ https://leetcode.com/problems/word-pattern/description/
    func wordPattern(_ pattern: String, _ s: String) -> Bool {
        var alphabet = [Character: String]()
        var savedWords = Set<String>()
        var i = 0
        let sChars = Array(s)
        for char in pattern {
            var string = ""
            if i >= s.count { return false }
            while i < s.count && sChars[i] != " " {
                string.append(sChars[i])
                i += 1
            }
            i += 1
            if let word = alphabet[char] {
                if word != string { return false }
            } else {
                if savedWords.contains(string) { return false }
                alphabet[char] = string
                savedWords.insert(string)
            }
        }
        return i > s.count
    }
}
