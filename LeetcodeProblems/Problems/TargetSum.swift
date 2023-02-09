//
//  TargetSum.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 07.02.2023.
//

import Foundation

final class TargetSum {
    struct Index: Hashable {
        let count: Int
        let target: Int
    }
    var saved: [Index: Int] = [:]
    func findTargetSumWays(_ nums: [Int], _ target: Int) -> Int {
        if nums.isEmpty { return 0 }
        return findTargetSumWays(nums, target, i: 0)
    }
    func findTargetSumWays(_ nums: [Int], _ target: Int, i: Int) -> Int {
        if i == nums.count - 1 {
            var result: Int = 0
            if nums[i] == target {
                result += 1
            }
            if -nums[i] == target {
                result += 1
            }
            return result
        }
        let index: Index = .init(count: nums.count - i, target: target)
        if let result: Int = saved[index] {
            return result
        }
        let positiveResult: Int = findTargetSumWays(nums, target + nums[i], i: i + 1)
        let negativeResult: Int = findTargetSumWays(nums, target - nums[i], i: i + 1)
        let result: Int = positiveResult + negativeResult
        saved[index] = result
        return result
    }
    struct Case {
        let nums: [Int]
        let target: Int
        let result: Int
    }
    func test() {
        let cases: [Case] = [
//            .init(nums: [1,0], target: 1, result: 2),
            .init(nums: [1,1,1], target: 1, result: 3),
            .init(nums: [1,1,1,1,1], target: 3, result: 5),
            .init(nums: [1], target: 1, result: 1),
        ]
        for i in 0..<cases.count {
            let c: Case = cases[i]
            if findTargetSumWays(c.nums, c.target) != c.result {
                print("Error in \(i)")
                return
            }
        }
    }
}
