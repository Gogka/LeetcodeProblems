//
//  DecodeString.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 13.02.2023.
//

import Foundation

struct DecodeString {
    /// ✅ https://leetcode.com/problems/decode-string/description/
    func decodeString(_ s: String) -> String {
        var repeating: [Int] = []
        var stack: [[Character]] = [[]]
        var num: [Character] = []
        for char in s {
            if char == "[" {
                repeating.append(Int(String(num))!)
                num.removeAll(keepingCapacity: true)
                stack.append([])
            } else if char == "]" {
                let repeatTimes: Int = repeating.removeLast()
                let characters: [Character] = stack.removeLast()
                for i in 0..<characters.count * repeatTimes {
                    stack[stack.count - 1].append(characters[i % characters.count])
                }
            } else if char.isNumber {
                num.append(char)
            } else {
                stack[stack.count - 1].append(char)
            }
        }
        return .init(stack.first!)
    }
    struct Case {
        let s: String
        let result: String
    }
    func test() {
        let cases: [Case] = [
            .init(s: "100[leetcode]", result: "leetcodeleetcodeleetcodeleetcodeleetcodeleetcodeleetcodeleetcodeleetcodeleetcodeleetcodeleetcodeleetcodeleetcodeleetcodeleetcodeleetcodeleetcodeleetcodeleetcodeleetcodeleetcodeleetcodeleetcodeleetcodeleetcodeleetcodeleetcodeleetcodeleetcodeleetcodeleetcodeleetcodeleetcodeleetcodeleetcodeleetcodeleetcodeleetcodeleetcodeleetcodeleetcodeleetcodeleetcodeleetcodeleetcodeleetcodeleetcodeleetcodeleetcodeleetcodeleetcodeleetcodeleetcodeleetcodeleetcodeleetcodeleetcodeleetcodeleetcodeleetcodeleetcodeleetcodeleetcodeleetcodeleetcodeleetcodeleetcodeleetcodeleetcodeleetcodeleetcodeleetcodeleetcodeleetcodeleetcodeleetcodeleetcodeleetcodeleetcodeleetcodeleetcodeleetcodeleetcodeleetcodeleetcodeleetcodeleetcodeleetcodeleetcodeleetcodeleetcodeleetcodeleetcodeleetcodeleetcodeleetcodeleetcodeleetcodeleetcode"),
            .init(s: "3[a]2[bc]", result: "aaabcbc"),
            .init(s: "3[a2[c]]", result: "accaccacc"),
            .init(s: "2[abc]3[cd]ef", result: "abcabccdcdcdef"),
        ]
        for i in 0..<cases.count {
            let c: Case = cases[i]
            if decodeString(c.s) != c.result {
                print("Error in \(i)")
                return
            }
        }
    }
}
