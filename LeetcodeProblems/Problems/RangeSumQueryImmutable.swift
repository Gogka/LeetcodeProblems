//
//  RangeSumQueryImmutable.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 13.04.2024.
//

import Foundation
final class RangeSumQueryImmutable {
    /// ✅ https://leetcode.com/problems/range-sum-query-immutable/
    let nums: [Int]
    let sums: [Int]
    init(_ nums: [Int]) {
        self.nums = nums
        var sums = [nums.first!]
        sums.reserveCapacity(nums.count)
        for i in 1..<nums.count {
            sums.append(sums[i - 1] + nums[i])
        }
        self.sums = sums
    }
    func sumRange(_ left: Int, _ right: Int) -> Int {
        sums[right] - sums[left] + nums[left]
    }
    
}
