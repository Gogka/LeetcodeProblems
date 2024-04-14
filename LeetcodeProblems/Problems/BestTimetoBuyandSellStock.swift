//
//  BestTimetoBuyandSellStock.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 10.04.2024.
//

import Foundation

final class BestTimetoBuyandSellStock {
    /// ✅ https://leetcode.com/problems/best-time-to-buy-and-sell-stock/description/
    static func maxProfit(_ prices: [Int]) -> Int {
        var min = prices[0]
        var maxDiff = 0
        for i in 1..<prices.count {
            guard prices[i] > min else {
                min = prices[i]
                continue
            }
            maxDiff = max(maxDiff, prices[i] - min)
        }
        return maxDiff
    }
}
