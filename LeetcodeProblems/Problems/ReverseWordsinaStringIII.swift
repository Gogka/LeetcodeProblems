//
//  ReverseWordsinaStringIII.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 08.01.2023.
//

import Foundation
struct ReverseWordsinaStringIII {
    /// ✅ https://leetcode.com/problems/reverse-words-in-a-string-iii/description/
    func reverseWords(_ s: String) -> String {
        var chars: [Character] = .init(s)
        var wordStart: Int?
        let reverseWord: (Int, Int) -> Void = {
            let count: Int = $1-$0
            for i in $0..<$0 + count / 2 {
                (chars[i], chars[$1 - 1 - i + $0]) = (chars[$1 - 1 - i + $0], chars[i])
            }
        }
        for i in 0..<chars.count {
            if chars[i] != " " {
                if wordStart == nil { wordStart = i }
            } else {
                reverseWord(wordStart!, i)
                wordStart = nil
            }
        }
        reverseWord(wordStart!, chars.count)
        return String(chars)
    }
    private struct Example {
        let s: String
        let res: String
    }
    func test() {
        let examples: [Example] = [
            .init(s: "Let's take LeetCode contest", res: "s'teL ekat edoCteeL tsetnoc"),
            .init(s: "God Ding", res: "doG gniD"),
        ]
        for (i, ex) in examples.enumerated() {
            if reverseWords(ex.s) != ex.res {
                print("Error in \(i + 1).")
                return
            }
        }
    }
}
