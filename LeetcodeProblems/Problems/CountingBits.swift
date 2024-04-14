//
//  CountingBits.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 13.04.2024.
//

import Foundation

final class CountingBits {
    /// ✅ https://leetcode.com/problems/counting-bits/description/
    func countBits(_ n: Int) -> [Int] {
        var result = Array(repeating: 0, count: n + 1)
        for i in 0...n {
            result[i] += i % 2 + result[i / 2]
        }
        return result
    }
}
