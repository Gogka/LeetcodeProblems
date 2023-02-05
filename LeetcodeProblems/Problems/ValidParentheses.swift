//
//  ValidParentheses.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 05.02.2023.
//

import Foundation

struct ValidParentheses {
    /// ✅ https://leetcode.com/problems/valid-parentheses/description/
    func isValid(_ s: String) -> Bool {
        var stack: Stack<Character> = []
        for char in s {
            if char == "(" || char == "{" || char == "[" {
                stack.push(char)
            } else {
                switch char {
                case ")":
                    if stack.pop().map({ $0 != "(" }) ?? true {
                        return false
                    }
                case "}":
                    if stack.pop().map({ $0 != "{" }) ?? true {
                        return false
                    }
                case "]":
                    if stack.pop().map({ $0 != "[" }) ?? true {
                        return false
                    }
                default: continue
                }
            }
        }
        return stack.top == nil
    }
    struct Case {
        let s: String
        let result: Bool
    }
    func test() {
        let cases: [Case] = [
            .init(s: "()", result: true),
            .init(s: "()[]{}", result: true),
            .init(s: "(]", result: false),
            .init(s: "([)]", result: true)
        ]
        for i in 0..<cases.count {
            let c: Case = cases[i]
            if isValid(c.s) != c.result {
                print("Error in \(i)")
                return
            }
        }
    }
}
