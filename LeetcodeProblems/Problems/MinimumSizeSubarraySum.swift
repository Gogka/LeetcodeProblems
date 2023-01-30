//
//  MinimumSizeSubarraySum.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 08.01.2023.
//

import Foundation

struct MinimumSizeSubarraySum {
    func minSubArrayLen(_ target: Int, _ nums: [Int]) -> Int {
        var i: Int = 0
        var j: Int = 0
        var sum: Int = 0
        var minSubarray: Int?
        while j < nums.count {
            if nums[j] >= target { return 1 }
            var newSum: Int = sum + nums[j]
            if newSum >= target {
                while newSum >= target {
                    if newSum - nums[i] >= target {
                        newSum = newSum - nums[i]
                        i += 1
                    } else {
                        break
                    }
                }
                if let _minSubarray: Int = minSubarray {
                    minSubarray = min(_minSubarray, j - i + 1)
                } else {
                    minSubarray = j - i + 1
                }
            }
            sum = newSum
            j += 1
        }
        return minSubarray ?? 0
    }
    private struct Example {
        let nums: [Int]
        let target: Int
        let res: Int
    }
    func test() {
        let examples: [Example] = [
            .init(nums: [2,3,1,2,4,3], target: 7, res: 2),
            .init(nums: [1,4,4], target: 4, res: 1),
            .init(nums: [1,1,1,1,1,1,1,1], target: 11, res: 0),
            .init(nums: [12,28,83,4,25,26,25,2,25,25,25,12], target: 213, res: 8)
        ]
        for (i, ex) in examples.enumerated() {
            if minSubArrayLen(ex.target, ex.nums) != ex.res {
                print("Error in \(i + 1).")
                return
            }
        }
    }
}
