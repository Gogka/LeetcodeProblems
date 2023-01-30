//
//  FindNumberswithEvenofDigits.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 03.01.2023.
//

import Foundation

struct FindNumberswithEvenofDigits {
    /// ✅ https://leetcode.com/problems/find-numbers-with-even-number-of-digits/description/
    func findNumbers(_ nums: [Int]) -> Int {
        var count: Int = 0
        for i in 0..<nums.count {
            var num = nums[i]
            var power: Int = 1
            while num / 10 != 0 {
                power += 1
                num = num / 10
            }
            if power % 2 == 0 {
                count += 1
            }
        }
        return count
    }
}
