//
//  MaxConsecutiveOnes.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 03.01.2023.
//

import Foundation

struct MaxConsecutiveOnes {
    /// ✅ https://leetcode.com/problems/max-consecutive-ones/description/
    func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
        var maxValue: Int = 0
        var currentMax: Int = maxValue
        let count: Int = nums.count
        for i in 0..<count {
            let num = nums[i]
            if num == 1 {
                currentMax += 1
            } else {
                maxValue = max(maxValue, currentMax)
                if maxValue >= count - i { break }
                currentMax = 0
            }
        }
        maxValue = max(maxValue, currentMax)
        return maxValue
    }
}
