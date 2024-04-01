//
//  RomanToInteger.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 01.04.2024.
//

import Foundation

final class RomanToInteger {
    /// ✅ https://leetcode.com/problems/roman-to-integer/
    func romanToInt(_ s: String) -> Int {
        let alphabet = [
            Character("I"): 1,
            "V": 5,
            "X": 10,
            "L": 50,
            "C": 100,
            "D": 500,
            "M": 1000
        ]
        var sum = 0
        let count = s.count
        for i in 0..<count {
            let char = s[s.index(s.startIndex, offsetBy: i)]
            let value = alphabet[char]!
            if i == count - 1 {
                sum += value
                continue
            }
            let nextChar = s[s.index(s.startIndex, offsetBy: i + 1)]
            if (char == "I" && (nextChar == "V" || nextChar == "X")) ||
                (char == "X" && (nextChar == "L" || nextChar == "C")) ||
                (char == "C" && (nextChar == "D" || nextChar == "M")) {
                sum -= value
            } else {
                sum += value
            }
        }
        return sum
    }
    struct TestCase {
        let s: String
        let result: Int
    }
    func test() {
        let cases: [TestCase] = [
            .init(s: "III", result: 3),
            .init(s: "LVIII", result: 58),
            .init(s: "MCMXCIV", result: 1994),
        ]
        for tCase in cases.enumerated() {
            if romanToInt(tCase.element.s) != tCase.element.result {
                print("Error in \(tCase.offset)")
                return
            }
        }
    }
}
