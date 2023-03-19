//
//  MinCostClimbingStairs.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 19.03.2023.
//

import Foundation

final class MinCostClimbingStairs {
    /// ✅ https://leetcode.com/problems/min-cost-climbing-stairs/description/
    /// Bottom up
    func minCostClimbingStairs(_ cost: [Int]) -> Int {
        var prevPrevStair: Int = 0
        var prevStair: Int = 0
        for i in 2...cost.count {
            let iRes: Int = min(prevPrevStair + cost[i - 2], prevStair + cost[i - 1])
            prevPrevStair = prevStair
            prevStair = iRes
        }
        return prevStair
    }
    /// Top down
    var memo: [Int: Int] = [:]
//    func minCostClimbingStairs(_ cost: [Int]) -> Int {
//        minCostClimbingStairs(cost, i: cost.count)
//    }
    func minCostClimbingStairs(_ cost: [Int], i: Int) -> Int {
        if i < 2 { return 0 }
        if let val: Int = memo[i] { return val }
        let val: Int = min(minCostClimbingStairs(cost, i: i - 2) + cost[i - 2], minCostClimbingStairs(cost, i: i - 1) + cost[i - 1])
        memo[i] = val
        return val
    }
    struct TestCase {
        let nums: [Int]
        let result: Int
    }
    func test() {
        let cases: [TestCase] = [
            .init(nums: [10,15,20], result: 15),
            .init(nums: [1,100,1,1,1,100,1,1,100,1], result: 6),
        ]
        for (i, tCase) in cases.enumerated() {
            memo = [:]
            if minCostClimbingStairs(tCase.nums) != tCase.result {
                print("Error in:", i)
                return
            }
        }
    }
}
