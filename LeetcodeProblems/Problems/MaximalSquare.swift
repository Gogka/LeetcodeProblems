//
//  MaximalSquare.swift
//  LeetcodeProblems
//
//  Created by Igor Tomilin on 19.03.2023.
//

import Foundation

final class MaximalSquare {
    /// ✅ https://leetcode.com/problems/maximal-square/description/
    func maximalSquare(_ matrix: [[Character]]) -> Int {
        var dp: [[Int]] = .init(repeating: .init(repeating: 0, count: matrix.first!.count + 1), count: matrix.count + 1)
        var maxSide: Int = 0
        for row in (0..<matrix.count).reversed() {
            for column in (0..<matrix[row].count).reversed() {
                if matrix[row][column] == "0" { continue }
                let val: Int = 1 + min(dp[row][column + 1], dp[row + 1][column], dp[row + 1][column + 1])
                dp[row][column] = val
                maxSide = max(maxSide, val)
            }
        }
        return maxSide * maxSide
    }
    struct TestCase {
        let matrix: [[Character]]
        let result: Int
    }
    func test() {
        let cases: [TestCase] = [
            .init(matrix: [
                ["1","1","1","1","1","1","1","1"],
                ["1","1","1","1","1","1","1","0"],
                ["1","1","1","1","1","1","1","0"],
                ["1","1","1","1","1","0","0","0"],
                ["0","1","1","1","1","0","0","0"]],
                  result: 16),
            .init(matrix: [["1","0","1","0","0"],
                           ["1","0","1","1","1"],
                           ["1","1","1","1","1"],
                           ["1","0","0","1","0"]], result: 4),
            .init(matrix: [["0","1"],
                           ["1","0"]], result: 1),
            .init(matrix: [["0"]], result: 0)
        ]
        for (i, tCase) in cases.enumerated() {
//            memo.removeAll()
            if maximalSquare(tCase.matrix) != tCase.result {
                print("Error in:", i)
                return
            }
        }
    }
}
