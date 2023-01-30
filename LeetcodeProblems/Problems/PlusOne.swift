//
//  PlusOne.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 06.01.2023.
//

import Foundation

struct PlusOne {
    /// ✅ https://leetcode.com/problems/plus-one/description/
    func plusOne(_ digits: [Int]) -> [Int] {
        var copy: [Int] = digits
        var remainder: Int = 1
        for i in (0..<digits.count).reversed() {
            let sum: Int = digits[i] + remainder
            copy[i] = sum % 10
            remainder = sum / 10
        }
        if remainder != 0 {
            copy.insert(remainder, at: 0)
        }
        return copy
    }
    private struct Example {
        let nums: [Int]
        let res: [Int]
    }
    func test() {
        let examples: [Example] = [
            .init(nums: [3,6,1,0], res: [3,6,1,1]),
            .init(nums: [1,2,3,4], res: [1,2,3,5]),
            .init(nums: [1,0], res: [1,1]),
            .init(nums: [9], res: [1,0]),
        ]
        for (i, ex) in examples.enumerated() {
            if plusOne(ex.nums) != ex.res {
                print("Error in \(i + 1).")
                return
            }
        }
    }
}
