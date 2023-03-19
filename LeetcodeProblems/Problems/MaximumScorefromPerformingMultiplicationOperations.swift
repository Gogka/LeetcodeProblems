//
//  MaximumScorefromPerformingMultiplicationOperations.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 19.03.2023.
//

import Foundation

final class MaximumScorefromPerformingMultiplicationOperations {
    /// ✅ https://leetcode.com/problems/maximum-score-from-performing-multiplication-operations/description/
    /// Bottom up
    func maximumScore(_ nums: [Int], _ multipliers: [Int]) -> Int {
        var dp: [[Int]] = .init(repeating: .init(repeating: 0, count: nums.count + 1), count: multipliers.count + 1)
        for multIndex in (0..<multipliers.count).reversed() {
            for left in (0...multIndex).reversed() {
                let right: Int = nums.count - 1 - (multIndex - left)
                dp[multIndex][left] = max(
                    nums[left] * multipliers[multIndex] + dp[multIndex + 1][left + 1],
                    nums[right] * multipliers[multIndex] + dp[multIndex + 1][left]
                )
            }
        }
        return dp[0][0]
    }
    /// Top down
    private struct Index: Hashable {
        let multIndex: Int
        let left: Int
    }
    private var memo: [Index: Int] = [:]
//    func maximumScore(_ nums: [Int], _ multipliers: [Int]) -> Int {
//        maximumScore(nums, multipliers, multIndex: 0, left: 0)
//    }
    func maximumScore(_ nums: [Int], _ multipliers: [Int], multIndex: Int, left: Int) -> Int {
        if multIndex == multipliers.count { return 0 }
        let index: Index = .init(multIndex: multIndex, left: left)
        if let val: Int = memo[index] { return val }
        let right: Int = nums.count - 1 - (multIndex - left)
        let val: Int = max(maximumScore(nums, multipliers, multIndex: multIndex + 1, left: left + 1) + nums[left] * multipliers[multIndex],
                           maximumScore(nums, multipliers, multIndex: multIndex + 1, left: left) + nums[right] * multipliers[multIndex])
        memo[index] = val
        return val
    }
    struct TestCase {
        let nums: [Int]
        let multipliers: [Int]
        let result: Int
    }
    func test() {
        let cases: [TestCase] = [
            .init(nums: [1,2,3], multipliers: [3,2,1], result: 14),
            .init(nums: [-5,-3,-3,-2,7,1], multipliers: [-10,-5,3,4,6], result: 102)
        ]
        for (i, tCase) in cases.enumerated() {
            memo = [:]
            if maximumScore(tCase.nums, tCase.multipliers) != tCase.result {
                print("Error in:", i)
                return
            }
        }
    }
}
