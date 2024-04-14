//
//  HappyNumber.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 12.04.2024.
//

import Foundation

final class HappyNumber {
    var passed = Set<Int>()
    /// ✅ https://leetcode.com/problems/happy-number/description/
    func isHappy(_ n: Int) -> Bool {
        if passed.contains(n) { return false }
        passed.insert(n)
        var number = n
        var result = 0
        while number != 0 {
            let mod = number % 10
            result += mod * mod
            number = number / 10
        }
        return result == 1 ? true : isHappy(result)
    }
}
