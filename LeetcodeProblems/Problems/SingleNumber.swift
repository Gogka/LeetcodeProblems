//
//  SingleNumber.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 10.04.2024.
//

import Foundation

enum SingleNumber {
    /// ✅ https://leetcode.com/problems/single-number/
    static func singleNumber(_ nums: [Int]) -> Int {
        var result = 0
        var i = 0
        while i < nums.count {
            /// XOR
            result = result ^ nums[i]
            i += 1
        }
        return result
    }
}
