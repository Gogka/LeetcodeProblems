//
//  ExcelSheetColumnNumber.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 12.04.2024.
//

import Foundation

enum ExcelSheetColumnNumber {
    /// ✅ https://leetcode.com/problems/excel-sheet-column-number/description/
    static func titleToNumber(_ columnTitle: String) -> Int {
        let alphabet: [Character: Int] = [
            "A": 1,
            "B": 2,
            "C": 3,
            "D": 4,
            "E": 5,
            "F": 6,
            "G": 7,
            "H": 8,
            "I": 9,
            "J": 10,
            "K": 11,
            "L": 12,
            "M": 13,
            "N": 14,
            "O": 15,
            "P": 16,
            "Q": 17,
            "R": 18,
            "S": 19,
            "T": 20,
            "U": 21,
            "V": 22,
            "W": 23,
            "X": 24,
            "Y": 25,
            "Z": 26,
        ]
        var count = columnTitle.count - 1
        var result = 0
        for char in columnTitle {
            if count == 0 {
                result += alphabet[char]!
            } else {
                result += alphabet[char]! * pow(26, count)
            }
            count -= 1
        }
        return result
    }
    static func pow(_ val: Int, _ grade: Int) -> Int {
        if grade == 0 { return 1 }
        var result = val
        for _ in 1..<grade {
            result *= val
        }
        return result
    }
}
