//
//  ReverseWordsinaString.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 08.01.2023.
//

import Foundation

struct ReverseWordsinaString {
    /// ✅ https://leetcode.com/problems/reverse-words-in-a-string/description/
    func reverseWords(_ s: String) -> String {
        let characters: [Character] = .init(s)
        var words: [[Character]] = []
        var word: [Character] = []
        var charsCount: Int = 0
        for char in characters {
            if char == " " {
                if word.isEmpty { continue }
                words.append(word)
                charsCount += word.count
                word = []
            } else {
                word.append(char)
            }
        }
        if !word.isEmpty {
            words.append(word)
            charsCount += word.count
        }
        var result: [Character] = .init(repeating: Character(" "), count: charsCount + words.count - 1)
        var i: Int = 0
        while !words.isEmpty {
            if i > 0 {
                result[i] = " "
                i += 1
            }
            for char in words.popLast()! {
                result[i] = char
                i += 1
            }
        }
        return String(result)
    }
    private struct Example {
        let s: String
        let res: String
    }
    func test() {
        let examples: [Example] = [
            .init(s: "the sky is blue", res: "blue is sky the"),
            .init(s: "  hello world  ", res: "world hello"),
            .init(s: "a good   example", res: "example good a")
        ]
        for (i, ex) in examples.enumerated() {
            if reverseWords(ex.s) != ex.res {
                print("Error in \(i + 1).")
                return
            }
        }
    }
}
