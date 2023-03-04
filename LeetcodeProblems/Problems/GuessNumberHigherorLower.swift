//
//  GuessNumberHigherorLower.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 02.03.2023.
//

import Foundation

struct GuessNumberHigherorLower {
    /// ✅ https://leetcode.com/problems/guess-number-higher-or-lower/description/
    func guess(_ num: Int) -> Int { 0 }
    func guessNumber(_ n: Int) -> Int {
        var left: Int = 1
        var right: Int = n
        while left <= right {
            let mid: Int = (left + right) / 2
            let guessRes: Int = guess(mid)
            if guessRes == 0 {
                return mid
            } else if guessRes < 0 {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        return -1
    }
}
