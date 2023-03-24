//
//  CoinChange.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 24.03.2023.
//

import Foundation

final class CoinChange {
    /// ✅ https://leetcode.com/problems/coin-change/description/
    /// Bottom up
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        var dp: [Int] = .init(repeating: -1, count: amount + 1)
        dp[0] = 0
        for i in 1..<dp.count {
            for j in 0..<coins.count {
                if i >= coins[j], dp[i - coins[j]] != -1 {
                    if dp[i] == -1 {
                        dp[i] = dp[i - coins[j]] + 1
                    } else {
                        dp[i] = min(dp[i], dp[i - coins[j]] + 1)
                    }
                }
            }
        }
        return dp[amount]
    }
    /// Top down
    var memo: [Int: Int] = [:]
//    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
//        memo = [:]
//        return coinChangeHelper(coins, amount)
//    }
    func coinChangeHelper(_ coins: [Int], _ amount: Int) -> Int {
        if amount == 0 { return 0 }
        if amount < 0 { return -1 }
        if let minAmount: Int = memo[amount] { return minAmount }
        var minAmount: Int = -1
        for i in 0..<coins.count {
            let result: Int = coinChangeHelper(coins, amount - coins[i])
            if result == -1 { continue }
            if minAmount == -1 {
                minAmount = result + 1
            } else {
                minAmount = min(minAmount, result + 1)
            }
        }
        memo[amount] = minAmount
        return minAmount
    }
    private struct TestCase {
        let coins: [Int]
        let amount: Int
        let result: Int
    }
    func test() {
        let cases: [TestCase] = [
            .init(coins: [1,2,5], amount: 11, result: 3),
            .init(coins: [2], amount: 3, result: -1),
            .init(coins: [1], amount: 0, result: 0),
        ]
        for (i, tCase) in cases.enumerated() {
            if coinChange(tCase.coins, tCase.amount) != tCase.result {
                print("Error in \(i)")
                return
            }
        }
    }
}
