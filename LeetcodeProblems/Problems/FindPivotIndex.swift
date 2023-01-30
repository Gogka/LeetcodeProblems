//
//  FindPivotIndex.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 06.01.2023.
//

import Foundation

struct FindPivotIndex {
    /// ✅ https://leetcode.com/problems/find-pivot-index/description/
    func pivotIndex(_ nums: [Int]) -> Int {
        var leftSum: Int = 0
        var rightSum: Int = nums.reduce(into: 0, { $0 += $1 })
        for i in 0..<nums.count {
            rightSum -= nums[i]
            if leftSum == rightSum { return i }
            leftSum += nums[i]
        }
        return -1
    }
    private struct Example {
        let nums: [Int]
        let res: Int
    }
    func test() {
        let examples: [Example] = [
            .init(nums: [1,7,3,6,5,6], res: 3),
            .init(nums: [1,2,3], res: -1),
            .init(nums: [2,1,-1], res: 0),
        ]
        for (i, ex) in examples.enumerated() {
            if pivotIndex(ex.nums) != ex.res {
                print("Error in \(i + 1).")
                return
            }
        }
    }
}
