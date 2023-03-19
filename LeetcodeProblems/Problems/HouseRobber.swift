//
//  HouseRobber.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 19.03.2023.
//

import Foundation

final class HouseRobber {
    /// ✅ https://leetcode.com/problems/house-robber/description/
    /// Bottom up
    func rob(_ nums: [Int]) -> Int {
        if nums.count < 2 { return nums.first! }
        var result: [Int] = .init()
        result.reserveCapacity(nums.count)
        result.append(nums[0])
        result.append(max(nums[0], nums[1]))
        for i in 2..<nums.count {
            result.append(max(result[i - 2] + nums[i], result[i - 1]))
        }
        return result.last!
    }
    /// Top down
//    func rob(_ nums: [Int]) -> Int {
//        robTopDown(nums: nums, i: nums.count - 1)
//    }
    var memo: [Int: Int] = [:]
    func robTopDown(nums: [Int], i: Int) -> Int {
        if i == 0 { return nums[i] }
        if i == 1 { return max(nums[0], nums[i]) }
        if let value: Int = memo[i] {
            return value
        }
        let value: Int = max(robTopDown(nums: nums, i: i - 1), robTopDown(nums: nums, i: i - 2) + nums[i])
        memo[i] = value
        return value
    }
    struct TestCase {
        let nums: [Int]
        let result: Int
    }
    func test() {
        let cases: [TestCase] = [
            .init(nums: [1,2,3,1], result: 4),
            .init(nums: [2,7,9,3,1], result: 12),
        ]
        for (i, tCase) in cases.enumerated() {
            memo = [:]
            if rob(tCase.nums) != tCase.result {
                print("Error in:", i)
                return
            }
        }
    }
}
